sap.ui.define([
  "sap/m/MessageBox"
], function (MessageBox) {
  'use strict';

  return {
    assignQuestionsToTest: async function () {
      if (!this.countDialog) {
        this.countDialog = await this.loadFragment({
          name: "fullstackdevchallenge.ext.fragment.QuestionsCountDialog",
        })
      }
      this.addDependent(this.countDialog)
      this.countDialog.open()
    },

    onSubmitCountDialog: async function (oEvent) {
      const nCount = Number(this.countDialog.getContent()[0].getAggregation("items")[1].getValue())
      const sTestID = this.getBindingContext().getProperty("ID")

      const oActionBinding = this.getBindingContext().getModel().bindContext(`/Tests(ID=${sTestID},IsActiveEntity=true)/DevChallengeService.assignQuestionsToTest(...)`)
      oActionBinding.setParameter("questionsCount", nCount)
      await oActionBinding.execute()
      try {
        const sResult = oActionBinding.getBoundContext().getProperty("value")
        if (sResult) {
          MessageBox.information(sResult)
        }
      } catch (error) {
        MessageBox.error(oError.message)
      }
      await this.getBindingContext().refresh()
      this.countDialog.close()
    },

    onOpenDialog: async function () {
      if (!this.countDialog) {
        this.countDialog = await this.loadFragment({
          name: "fullstackdevchallenge.ext.fragment.QuestionsCountDialog",
        })
      }
      this.addDependent(this.countDialog)
      this.countDialog.open()
    },

    onCloseCountDialog: function (oEvent) {
      oEvent.getSource().getParent().close()
    },

    onBeforeCloseCountDialog: function () {
      this.countDialog.getContent()[0].getAggregation("items")[1].resetProperty("value")
    }
  }
})