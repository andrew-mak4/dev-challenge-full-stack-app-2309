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
    Facets                 : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'TestDetailsFacet',
        Label : 'Test Details',
        Target: '@UI.FieldGroup#TestDetails',
    }, ],
    FieldGroup #TestDetails: {Data: [
        {Value: title},
        {Value: description},
        {Value: createdBy},
        {Value: createdAt}
    ]},
});
