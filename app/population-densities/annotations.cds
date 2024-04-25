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
            Criticality : criticality,
            CriticalityRepresentation : #WithoutIcon,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Population}',
            Value : population,
            Criticality : criticality,
            CriticalityRepresentation : #WithoutIcon,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Area}',
            Value : area,
            Criticality : criticality,
            CriticalityRepresentation : #WithoutIcon,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Density}',
            Value : density,
            Criticality : criticality,
            CriticalityRepresentation : #WithoutIcon,
        },
    ],
);

annotate service.Cities with @(
    UI.SelectionFields : []
);

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
annotate service.Cities with @(
    UI.SelectionPresentationVariant #table : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
            SortOrder : [
                {
                    $Type : 'Common.SortOrderType',
                    Property : name,
                    Descending : false,
                },
                {
                    $Type : 'Common.SortOrderType',
                    Property : population,
                    Descending : false,
                },
                {
                    $Type : 'Common.SortOrderType',
                    Property : area,
                    Descending : false,
                },
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
    }
);
annotate service.Cities with {
    name @Common.FieldControl : #Mandatory
};
annotate service.Cities with {
    population @Common.FieldControl : #Mandatory
};
annotate service.Cities with {
    area @Common.FieldControl : #Mandatory
};
annotate service.Cities with {
    area @Measures.Unit : 'sq. km.'
};
annotate service.Cities with {
    density @Common.FieldControl : #ReadOnly
};
annotate service.Cities with {
    density @Measures.Unit : 'per sq. km.'
};