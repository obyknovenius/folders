public class DirectoryModel : Gtk.TreeModel {
    
    private Sequence<FileInfo> items;
    
    private File _directory;
    public File directory { 
        get {
            return _directory;
        }
        set {
            _directory = value;
            reload ();
        }
    }
    
    public DirectoryModel (File directory) {
        Object (directory: directory);
    }
    
    construct {
        items = new Sequence<FileInfo> ();
    }
    
    void reload () {
        directory.enumerate_children_async.begin ("standard::*", FileQueryInfoFlags.NOFOLLOW_SYMLINKS, Priority.DEFAULT, null, (obj, res) => {
            try {
                FileEnumerator enumerator = directory.enumerate_children_async.end (res);
                FileInfo info;
                while ((info = enumerator.next_file (null)) != null) {
                    items.append(info);
                }
            } catch (Error e) {
                stdout.printf ("Error: %s\n", e.message);
            }
        });
    }
    
    public Gtk.TreeModelFlags get_flags () {
        return Gtk.TreeModelFlags.TERS_PERSIST | Gtk.TreeModelFlags.LIST_ONLY;
    }
    
    public int get_n_columns () {
    }
}
