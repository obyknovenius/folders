public class MainWindow : Gtk.ApplicationWindow {

    public MainWindow(Gtk.Application application) {
        Object (
            application: application
        );
    }
    
    construct {
        default_width = 800;
        default_height = 600;
        
        var back_button = new Gtk.Button.with_label ("Back");
        back_button.get_style_context ().add_class (Granite.STYLE_CLASS_BACK_BUTTON);
        
        var search_entry = new Gtk.SearchEntry ();
        search_entry.placeholder_text = "Search";
        
        var header_bar = new Gtk.HeaderBar ();
        header_bar.title = "Home";
        header_bar.show_close_button = true;
        
        header_bar.pack_start (back_button);
        header_bar.pack_end (search_entry);
        
        set_titlebar (header_bar);
        
        var notebook = new Granite.Widgets.DynamicNotebook ();
        notebook.allow_restoring = true;
        notebook.allow_duplication = true;
        notebook.allow_new_window = true;
        
        var sidebar = new Sidebar ();
        
        var icon_view = new IconView ();
        
        var paned = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
        paned.position = 140;
        
        paned.pack1 (sidebar, false, false);
        paned.pack2 (icon_view, true, false);
        
        var tab = new Granite.Widgets.Tab ("Home", null, paned);
        notebook.insert_tab (tab, -1);
        
        add (notebook);
    }
}
