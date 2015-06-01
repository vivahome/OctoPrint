$(function() {
    function AppearanceViewModel(parameters) {
        var self = this;

        self.name = parameters[0].appearance_name;
        self.color = parameters[0].appearance_color;
        self.colorTransparent = parameters[0].appearance_colorTransparent;

        self.brand = ko.computed(function() {
            if (self.name())
                return gettext("Viva Home") + ": " + self.name();
            else
                return gettext("Viva Home");
        });

        self.title = ko.computed(function() {
            if (self.name())
                return self.name() + " [" + gettext("Viva Home") + "]";
            else
                return gettext("Viva Home");
        });
    }

    OCTOPRINT_VIEWMODELS.push([
        AppearanceViewModel,
        ["settingsViewModel"],
        "head"
    ]);
});
