class Region < ActiveHash::Base
  include ActiveHash::Associations

  has_many :countries

  self.data = [
    {
      id: 'south-america',
      name: 'South America',
      countries_list: [
        {
          identifier: 'sam1',
          href: '#argentina',
          name: 'Argentina'
        },
        {
          identifier: 'sam2',
          href: '#bolivia',
          name: 'Bolivia'
        },
        {
          identifier: 'sam3',
          href: '#brazil',
          name: 'Brazil'
        },
        {
          identifier: 'sam4',
          href: '#chile',
          name: 'Chile'
        },
        {
          identifier: 'sam5',
          href: '#colombia',
          name: 'Colombia'
        },
        {
          identifier: 'sam6',
          href: '#ecuador',
          name: 'Ecuador'
        },
        {
          identifier: 'sam7',
          href: '#guyana',
          name: 'Guyana'
        },
        {
          identifier: 'sam8',
          href: '#french-guiana',
          name: 'Guyane (French Guiana)'
        },
        {
          identifier: 'sam9',
          href: '#paraguay',
          name: 'Paraguay'
        },
        {
          identifier: 'sam10',
          href: '#peru',
          name: 'Peru'
        },
        {
          identifier: 'sam11',
          href: '#suriname',
          name: 'Suriname'
        },
        {
          identifier: 'sam12',
          href: '#uruguay',
          name: 'Uruguay'
        },
        {
          identifier: 'sam13',
          href: '#venezuela',
          name: 'Venezuela'
        },
        {
          identifier: 'sam14',
          href: '#falkland-islands',
          name: 'Falkland Islands'
        }
      ]
    },
    {
      id: 'africa',
      name: 'Africa',
      countries_list: []
    },
  ]
end
