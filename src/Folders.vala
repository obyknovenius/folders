public class Folders : Granite.Application {
    const string APP_NAME = "io.elementary.files";

    construct {
        application_id = "com.github.obyknovenius.folders";
        flags = ApplicationFlags.FLAGS_NONE;
        
        program_name = "Folders";
    }
    
    public override void activate () {
        var window = new MainWindow (this);
        
        window.show_all ();
	}
}
