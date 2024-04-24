using CityService as service from '../../srv/service';
annotate service.Cities with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Name}',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Population}',
                Value : population,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Area}',
                Value : area,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Density}',
                Value : density,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Name}',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Population}',
            Value : population,
            Criticality : population,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Area}',
            Value : area,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Density}',
            Value : density,
        },
    ],
);

annotate service.Cities with @(
    UI.SelectionFields : [
        name,
    ]
);

annotate service.Cities with {
    name @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Cities',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : name,
                    ValueListProperty : 'name',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Cities with {
    name @Common.Label : '{i18n>Name}'
};
annotate service.Cities with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : 'City Information',
        },
        TypeImageUrl : '',
    }
);
annotate service.Cities with @(
    UI.FieldGroup #Population : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);
