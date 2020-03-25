sap.ui.define([
	"sap/ui/core/mvc/Controller"
], function (Controller) {
	"use strict";

	return Controller.extend("com.numenit.HelloWorld.controller.View1", {
		onOpenDialog: function () {
			this.getOwnerComponent().openHelloDialog();
		}
	});
});