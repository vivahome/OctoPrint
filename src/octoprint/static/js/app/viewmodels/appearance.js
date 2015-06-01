$(function() {
    function AppearanceViewModel(parameters) {
        var self = this;

        self.name = parameters[0].appearance_name;
        self.color = parameters[0].appearance_color;
        self.colorTransparent = parameters[0].appearance_colorTransparent;

        self.brand = ko.computed(function() {
            if (self.name())
                return gettext("OctoP") + ": " + self.name();
            else
                return gettext("OctoP");
        });

        self.title = ko.computed(function() {
            if (self.name())
                return self.name() + " [" + gettext("Octo") + "]";
            else
                return gettext("Octo");
        });
    }

    OCTOPRINT_VIEWMODELS.push([
        AppearanceViewModel,
        ["settingsViewModel"],
        "head"
    ]);
});
