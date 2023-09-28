using DevChallengeService as service from '../../srv/cat-service';

annotate fullstack_dev_challenge.Tests with @(UI: {
    HeaderInfo     : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Test',
        TypeNamePlural: 'Tests',
        Title         : {
            $Type: 'UI.DataField',
            Value: title
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: description,
        }
    },
    SelectionFields: [],
    Identification : [{Value: title}],
    LineItem       : [
        {Value: title},
        {Value: description},
        {Value: createdBy},
        {Value: createdAt}
    ]
});

annotate fullstack_dev_challenge.Tests with @(UI: {
    Facets                 : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'TestDetailsFacet',
            Label : 'Test Details',
            Target: '@UI.FieldGroup#TestDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Questions',
            Target: 'questions/@UI.PresentationVariant'
        }
    ],
    FieldGroup #TestDetails: {Data: [
        {Value: title},
        {Value: description},
        {Value: createdBy},
        {Value: createdAt}
    ]},
});

// annotate fullstack_dev_challenge.Tests with @(UI.Identification: [{
//     $Type            : 'UI.DataFieldForAction',
//     Label            : 'Add Questions',
//     Action           : 'DevChallengeService.assignQuestionsToTest',
//     ![@UI.Importance]: #High
// }]);
// No need any more to define a button for the custom action.
// Instead it's used an extension for button on the web app side

annotate fullstack_dev_challenge.Questions with @(UI: {
    PresentationVariant: {Visualizations: ['@UI.LineItem']},
    LineItem           : [
        {
            $Type: 'UI.DataField',
            Value: text,
            Label: 'Question',
            ![@HTML5.CssDefaults] : {width : '40%'}
        },
        {
            $Type: 'UI.DataField',
            Value: answer.text,
            Label: 'Answer',
            ![@HTML5.CssDefaults] : {width : '40%'}
        }
    ]
});
