const cds = require('@sap/cds')

module.exports = async function () {
    this.on("assignQuestionsToTest", "Tests", async (req, _next) => {
        const questionsCount = req.data.questionsCount
        if (questionsCount <= 0) {
            const message = `There is nothing to do. The number of questions to assign is ${questionsCount}.`
            req.warn({ message })
            return message
        }

        const unassignedQuestionsQuery = SELECT`from fullstack_dev_challenge.Questions {ID, test } where test = null`
        const unassignedQuestions = await unassignedQuestionsQuery
        const unassignedQuestionsCount = unassignedQuestions?.length

        if (!unassignedQuestions?.length) {
            const message = "There are no available questions for assignment."
            req.warn({ message })
            return message
        }

        const testID = req.params[0]?.ID
        if (questionsCount - unassignedQuestionsCount > 0) {
            assignQuestions(unassignedQuestions, testID, unassignedQuestionsCount)
            const message = `Only ${unassignedQuestionsCount} question(s) added to the Test. There are not enough unassigned questions.`
            req.info({ message })
            return message
        }

        assignQuestions(unassignedQuestions, testID, questionsCount)
        const message = `${questionsCount} question(s) successfully added to the Test.`
        req.info({ message })
        return message
    });

    async function assignQuestions(questions, testID, count) {
        for (let i = 0; i < count; i++) {
            await cds.db.run(UPDATE`fullstack_dev_challenge.Questions`.set`test_ID=${testID}`.where`ID=${questions[i].ID}`)
        }
    }
};