using Granite.Widgets;

public class Sidebar : SourceList {

    private const string ICON_NAME_HOME    = "user-home";
    private const string ICON_NAME_DESKTOP = "user-desktop";
    
    private const string ICON_NAME_FOLDER           = "folder";
    private const string ICON_NAME_FOLDER_DOCUMENTS = "folder-documents";
    private const string ICON_NAME_FOLDER_DOWNLOAD  = "folder-download";
    private const string ICON_NAME_FOLDER_MUSIC     = "folder-music";
    private const string ICON_NAME_FOLDER_PICTURES  = "folder-pictures";
    private const string ICON_NAME_FOLDER_VIDEOS    = "folder-videos";

    private SourceList.ExpandableItem personal_category;

    public Sidebar () {
        Object ();
    }
    
    construct {
        personal_category = new SourceList.ExpandableItem ("Personal");
        personal_category.expand_all ();
        
        root = new ExpandableItem ("");
        root.add (personal_category);
        
        update_places ();
    }
    
    private void update_places () {
        Icon icon;
        
        /* home folder */
        icon = new ThemedIcon.with_default_fallbacks (ICON_NAME_HOME);
        add_place ("Home", icon);
        
        /* XDG directories */
        add_special_dirs ();
    }
    
    private void add_place (string name,
                            Icon icon) {
                            
        var item = new SourceList.Item (name);
        item.icon = icon;
        
        personal_category.add (item);
    }
    
    private void add_special_dirs () {
        for (UserDirectory dir = 0; dir < UserDirectory.N_DIRECTORIES; dir += 1) {
            var path = Environment.get_user_special_dir (dir);
            
            var root = File.new_for_path (path);
            
            var name = root.get_basename ();
            var icon = special_directory_get_gicon (dir);
            
            add_place (name, icon);
        }
    }
    
    private Icon special_directory_get_gicon (UserDirectory directory) {
        switch (directory) {
            case UserDirectory.DESKTOP:
                return new ThemedIcon.with_default_fallbacks (ICON_NAME_DESKTOP);
            case UserDirectory.DOCUMENTS:
                return new ThemedIcon.with_default_fallbacks (ICON_NAME_FOLDER_DOCUMENTS);
            case UserDirectory.DOWNLOAD:
                return new ThemedIcon.with_default_fallbacks (ICON_NAME_FOLDER_DOWNLOAD);
            case UserDirectory.MUSIC:
                return new ThemedIcon.with_default_fallbacks (ICON_NAME_FOLDER_MUSIC);
            case UserDirectory.PICTURES:
                return new ThemedIcon.with_default_fallbacks (ICON_NAME_FOLDER_PICTURES);
            case UserDirectory.VIDEOS :
                return new ThemedIcon.with_default_fallbacks (ICON_NAME_FOLDER_VIDEOS);
            default:
                return new ThemedIcon.with_default_fallbacks (ICON_NAME_FOLDER);
        }
    }
}
