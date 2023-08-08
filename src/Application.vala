/*
 * SPDX-License-Identifier: LGPL-3.0-or-later
 * SPDX-FileCopyrightText: 2023 Agustin Mediotti (agustinmediotti@gmail.com)
 */
 
public class Metronome : Gtk.Application {
    private const double default_bpm = 60.0;
    private bool is_playing = false;
    public Metronome () {
        Object (
            application_id: "com.github.Agustin-Mediotti.metronome",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var bpm_label = new Gtk.Label("Adagietto");
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
        
        bpm_control.value_changed.connect (() => {
            if  (bpm_control.get_value_as_int () >= 1 && bpm_control.get_value_as_int () < 20) {
                bpm_label.set_label ("Larghissimo");
            } else if (bpm_control.get_value_as_int () >= 20 && bpm_control.get_value_as_int () < 40) {
                bpm_label.set_label ("Grave");
            } else if (bpm_control.get_value_as_int () >= 40 && bpm_control.get_value_as_int () < 44) {
                bpm_label.set_label ("Lento");
            } else if (bpm_control.get_value_as_int () >= 45 && bpm_control.get_value_as_int () < 50) {
                bpm_label.set_label ("Largo");
            } else if (bpm_control.get_value_as_int () >= 50 && bpm_control.get_value_as_int () < 60) {
                bpm_label.set_label ("Adagio");
            } else if (bpm_control.get_value_as_int () >= 60 && bpm_control.get_value_as_int () < 70) {
                bpm_label.set_label ("Adagietto");
            } else if (bpm_control.get_value_as_int () >= 70 && bpm_control.get_value_as_int () < 85) {
                bpm_label.set_label ("Andante");
            } else if (bpm_control.get_value_as_int () >= 85 && bpm_control.get_value_as_int () < 97) {
                bpm_label.set_label ("Moderato");
            } else if (bpm_control.get_value_as_int () >= 97 && bpm_control.get_value_as_int () < 109) {
                bpm_label.set_label ("Allegretto");
            } else if (bpm_control.get_value_as_int () >= 109 && bpm_control.get_value_as_int () < 131) {
                bpm_label.set_label ("Allegro");
            } else if (bpm_control.get_value_as_int () >= 131 && bpm_control.get_value_as_int () < 140) {
                bpm_label.set_label ("Vivace");
            } else if (bpm_control.get_value_as_int () >= 140 && bpm_control.get_value_as_int () < 177) {
                bpm_label.set_label ("Presto");
            } else if (bpm_control.get_value_as_int () >= 177 && bpm_control.get_value_as_int () < 241) {
                bpm_label.set_label ("Prestissimo");
            } else {
                bpm_label.set_label ("Illegal Operation ", bpm_control.get_value ());
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
        bpm_control.set_value(default_bpm);
        main_window.child = layout;
        main_window.present ();
    }

    public static int main (string[] args) {
        return new Metronome ().run (args);
    }
}
