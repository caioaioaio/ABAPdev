sap.ui.define([
	"sap/ui/core/UIComponent",
	"sap/ui/Device",
	"com/numenit/HelloWorld/model/models",
	"./controller/HelloDialog"
], function (UIComponent, Device, models, HelloDialog) {
	"use strict";

	return UIComponent.extend("com.numenit.HelloWorld.Component", {

		metadata: {
			manifest: "json"
		},

		init: function () {
			UIComponent.prototype.init.apply(this, arguments);
			this.getRouter().initialize();
			this.setModel(models.createDeviceModel(), "device");
			this._helloDialog = new HelloDialog(this.getRootControl());
		},

		exit : function() {
			this._helloDialog.destroy();
			delete this._helloDialog;
		},

		openHelloDialog : function () {
			this._helloDialog.open();
		}
		
	});
});