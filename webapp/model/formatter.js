sap.ui.define([], function () {
	"use strict";
	return {
		statusText: function (sStatus) {
			var resourceBundle = this.getView().getModel("i18n").getResourceBundle();
			if (["A", "B", "C"].indexOf(sStatus) > -1) {
				return resourceBundle.getText("invoiceStatus" + sStatus);
			}
			return sStatus;
		}
	};
});