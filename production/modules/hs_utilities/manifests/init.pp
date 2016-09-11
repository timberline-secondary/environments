
class hs_utilities {

  notify { 'Puppet Module - Utilities': }

	package { 'wine':
		ensure  => latest,
  }
  
  
}
