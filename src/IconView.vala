public class IconView : Gtk.ScrolledWindow {

    public IconView () {
        Object ();
    }
    
    construct {
        var view = new Gtk.IconView ();
        
        var directory_model = new DirectoryModel(File.new_for_path ("."));
    }
}
