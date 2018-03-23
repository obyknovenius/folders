public class SidebarRow : Gtk.ListBoxRow {

    private Gtk.Revealer revealer;
    private Gtk.Box box;
    private Gtk.Image start_icon_widget;
    private Gtk.Label label_widget;
    
    private Icon _start_icon;
    public  Icon  start_icon {
        get { return _start_icon; }
        set {
            _start_icon = value;
            
            if (value != null) {
                start_icon_widget.set_from_gicon (value, Gtk.IconSize.MENU);
            } else {
                start_icon_widget.clear ();
            }
        }
    }
    
    private string _label;
    public string label {
        get { return _label; }
        set {
            label_widget.label = value;
        }
    }
    
    construct {
        start_icon_widget = new Gtk.Image ();
        
        label_widget = new Gtk.Label (null);
        label_widget.xalign = 0;
        
        box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
        box.pack_start (start_icon_widget, false);
        box.pack_start (label_widget);
        
        revealer = new Gtk.Revealer ();
        revealer.reveal_child = true;
        revealer.add (box);
        
        add (revealer);
    }
}
