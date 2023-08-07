/*
 * SPDX-License-Identifier: LGPL-3.0-or-later
 * SPDX-FileCopyrightText: 2023 Agustin Mediotti (agustinmediotti@gmail.com)
 */
 
public class Metronome : Gtk.Application {
    private int bpm = 60;
    private bool is_playing = false;
    public Metronome () {
        Object (
            application_id: "com.github.Agustin-Mediotti.metronome",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var bpm_label = new Gtk.Label("BPM");
        var button_start = new Gtk.Button.from_icon_name ("media-playback-start");
        var bpm_control = new Gtk.SpinButton.with_range (1.0, 240.0, 1.0);
        
        var control_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 2);
        control_box.append (bpm_control);
        control_box.append (bpm_label);
        
        var layout = new Gtk.Grid () {
            column_spacing = 15,
            row_spacing = 10
        };

        button_start.clicked.connect (() => {
            is_playing = !is_playing;
            if (is_playing) {
                button_start.set_icon_name("media-playback-stop");
                // TODO: Play a sound every (bpm/60)
            } else {
                button_start.set_icon_name("media-playback-start");
            }
        });
        
        layout.attach (button_start, 1,1);
        layout.attach (control_box, 0,1);

        var main_window = new Gtk.ApplicationWindow (this) {
            default_height = 180,
            default_width = 450,
            resizable = false,
            title = "Metronome",
        };
        bpm_control.set_value(60);
        main_window.child = layout;
        main_window.present ();
    }

    public static int main (string[] args) {
        return new Metronome ().run (args);
    }
}
