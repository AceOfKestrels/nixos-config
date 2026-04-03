{ ... }:

{
    security.polkit.extraConfig = ''
        polkit.addRule(function(action, subject) {
          if ((action.id == "org.freedesktop.udisks2.filesystem-mount" ||
               action.id == "org.freedesktop.udisks2.filesystem-mount-system" ||
               action.id == "org.freedesktop.udisks2.filesystem-unmount-others" ||
               action.id == "org.freedesktop.udisks2.encrypted-unlock" ||
               action.id == "org.freedesktop.udisks2.eject-media" ||
               action.id == "org.freedesktop.udisks2.drive-eject" ||
               action.id == "org.freedesktop.udisks2.modify-device") &&
              subject.isInGroup("wheel")) {
            return polkit.Result.YES;
          }
        });
    '';
}
