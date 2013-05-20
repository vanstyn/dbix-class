use strict;
use warnings;
use Test::More;
use Test::Exception;

use lib qw(t/lib);
use DBICTest;

my $schema = DBICTest->init_schema( no_connect => 1, no_deploy => 1 );

use Devel::Dwarn;


is_deeply($schema->source_tree, {
  Artist => {},
  ArtistSubclass => {},
  ArtistUndirectedMap => {
    Artist => {
      dep_of => "ArtistUndirectedMap",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    }
  },
  Artwork => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Artwork",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Artwork_to_Artist => {
    Artist => {
      dep_of => "Artwork_to_Artist",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Artwork => {
      dep_of => "Artwork_to_Artist",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Artwork",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  BindType => {},
  Bookmark => {
    Link => {
      dep_of => "Bookmark",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 0
    }
  },
  BooksInLibrary => {
    Owners => {
      dep_of => "BooksInLibrary",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    }
  },
  CD => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  CD_to_Producer => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "CD_to_Producer",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Producer => {
      dep_of => "CD_to_Producer",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Collection => {},
  CollectionObject => {
    Collection => {
      dep_of => "CollectionObject",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    TypedObject => {
      dep_of => "CollectionObject",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    }
  },
  CustomSql => {},
  Dummy => {},
  Employee => {
    Encoded => {
      dep_of => "Employee",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 0
    }
  },
  Encoded => {},
  Event => {},
  EventTZ => {},
  ForceForeign => {
    Artist => {
      dep_of => "ForceForeign",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    }
  },
  FourKeys => {},
  FourKeys_to_TwoKeys => {
    Artist => {
      dep_of => "TwoKeys",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "TwoKeys",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    FourKeys => {
      dep_of => "FourKeys_to_TwoKeys",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    TwoKeys => {
      dep_of => "FourKeys_to_TwoKeys",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Genre => {},
  Image => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Artwork => {
      dep_of => "Image",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Artwork",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  LinerNotes => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "LinerNotes",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Link => {},
  LyricVersion => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 3,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Lyrics => {
      dep_of => "LyricVersion",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Track => {
      dep_of => "Lyrics",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Lyrics => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "Lyrics",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Money => {},
  NoPrimaryKey => {},
  OneKey => {},
  Owners => {},
  Producer => {},
  SelfRef => {},
  SelfRefAlias => {
    SelfRef => {
      dep_of => "SelfRefAlias",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    }
  },
  SequenceTest => {},
  Serialized => {},
  SourceNameArtists => {},
  Tag => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Tag",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  TimestampPrimaryKey => {},
  Track => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  TreeLike => {},
  TwoKeyTreeLike => {},
  TwoKeys => {
    Artist => {
      dep_of => "TwoKeys",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "TwoKeys",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  TypedObject => {}
}, 'got correct default source tree');

is_deeply($schema->source_tree( type => 'views' ),{
  Year1999CDs => {
    Artist => {
      dep_of => "Year1999CDs",
      deploy_dep => 1,
      depth => 0,
      for_view => 1,
      hard => 1,
      is_view => 0
    }
  },
  Year2000CDs => {
    Artist => {
      dep_of => "Year2000CDs",
      deploy_dep => 1,
      depth => 0,
      for_view => 1,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "Year2000CDs",
      deploy_dep => 0,
      depth => 0,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "Year2000CDs",
      deploy_dep => 0,
      depth => 0,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  }
},'got correct source tree for type => views');

is_deeply($schema->source_tree( type => 'all' ),{
  Artist => {},
  ArtistSubclass => {},
  ArtistUndirectedMap => {
    Artist => {
      dep_of => "ArtistUndirectedMap",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    }
  },
  Artwork => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Artwork",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Artwork_to_Artist => {
    Artist => {
      dep_of => "Artwork_to_Artist",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Artwork => {
      dep_of => "Artwork_to_Artist",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Artwork",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  BindType => {},
  Bookmark => {
    Link => {
      dep_of => "Bookmark",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 0
    }
  },
  BooksInLibrary => {
    Owners => {
      dep_of => "BooksInLibrary",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    }
  },
  CD => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  CD_to_Producer => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "CD_to_Producer",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Producer => {
      dep_of => "CD_to_Producer",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Collection => {},
  CollectionObject => {
    Collection => {
      dep_of => "CollectionObject",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    TypedObject => {
      dep_of => "CollectionObject",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    }
  },
  CustomSql => {},
  Dummy => {},
  Employee => {
    Encoded => {
      dep_of => "Employee",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 0
    }
  },
  Encoded => {},
  Event => {},
  EventTZ => {},
  ForceForeign => {
    Artist => {
      dep_of => "ForceForeign",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    }
  },
  FourKeys => {},
  FourKeys_to_TwoKeys => {
    Artist => {
      dep_of => "TwoKeys",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "TwoKeys",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    FourKeys => {
      dep_of => "FourKeys_to_TwoKeys",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    TwoKeys => {
      dep_of => "FourKeys_to_TwoKeys",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Genre => {},
  Image => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Artwork => {
      dep_of => "Image",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Artwork",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  LinerNotes => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "LinerNotes",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Link => {},
  LyricVersion => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 3,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Lyrics => {
      dep_of => "LyricVersion",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Track => {
      dep_of => "Lyrics",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Lyrics => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "Lyrics",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Money => {},
  NoPrimaryKey => {},
  OneKey => {},
  Owners => {},
  Producer => {},
  SelfRef => {},
  SelfRefAlias => {
    SelfRef => {
      dep_of => "SelfRefAlias",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    }
  },
  SequenceTest => {},
  Serialized => {},
  SourceNameArtists => {},
  Tag => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Tag",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  TimestampPrimaryKey => {},
  Track => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  TreeLike => {},
  TwoKeyTreeLike => {},
  TwoKeys => {
    Artist => {
      dep_of => "TwoKeys",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "TwoKeys",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  TypedObject => {},
  Year1999CDs => {
    Artist => {
      dep_of => "Year1999CDs",
      deploy_dep => 1,
      depth => 0,
      for_view => 1,
      hard => 1,
      is_view => 0
    }
  },
  Year2000CDs => {
    Artist => {
      dep_of => "Year2000CDs",
      deploy_dep => 1,
      depth => 0,
      for_view => 1,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "Year2000CDs",
      deploy_dep => 0,
      depth => 0,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "Year2000CDs",
      deploy_dep => 0,
      depth => 0,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  }
},'got correct source tree for type => all');

is_deeply($schema->source_tree({ type => 'views', limit_sources => ['Year2000CDs'] }),{
  Year2000CDs => {
    Artist => {
      dep_of => "Year2000CDs",
      deploy_dep => 1,
      depth => 0,
      for_view => 1,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "Year2000CDs",
      deploy_dep => 0,
      depth => 0,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "Year2000CDs",
      deploy_dep => 0,
      depth => 0,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  }
},'got correct source tree for type => views w/ limit_sources');

is_deeply($schema->source_tree( type => 'tables', exclude_sources => [qw(SequenceTest TwoKeys)] ),{
  Artist => {},
  ArtistSubclass => {},
  ArtistUndirectedMap => {
    Artist => {
      dep_of => "ArtistUndirectedMap",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    }
  },
  Artwork => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Artwork",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Artwork_to_Artist => {
    Artist => {
      dep_of => "Artwork_to_Artist",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Artwork => {
      dep_of => "Artwork_to_Artist",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Artwork",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  BindType => {},
  Bookmark => {
    Link => {
      dep_of => "Bookmark",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 0
    }
  },
  BooksInLibrary => {
    Owners => {
      dep_of => "BooksInLibrary",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    }
  },
  CD => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  CD_to_Producer => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "CD_to_Producer",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Producer => {
      dep_of => "CD_to_Producer",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Collection => {},
  CollectionObject => {
    Collection => {
      dep_of => "CollectionObject",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    TypedObject => {
      dep_of => "CollectionObject",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    }
  },
  CustomSql => {},
  Dummy => {},
  Employee => {
    Encoded => {
      dep_of => "Employee",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 0
    }
  },
  Encoded => {},
  Event => {},
  EventTZ => {},
  ForceForeign => {
    Artist => {
      dep_of => "ForceForeign",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    }
  },
  FourKeys => {},
  FourKeys_to_TwoKeys => {
    Artist => {
      dep_of => "TwoKeys",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "TwoKeys",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    FourKeys => {
      dep_of => "FourKeys_to_TwoKeys",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    TwoKeys => {
      dep_of => "FourKeys_to_TwoKeys",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Genre => {},
  Image => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Artwork => {
      dep_of => "Image",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Artwork",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  LinerNotes => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "LinerNotes",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Link => {},
  LyricVersion => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 3,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Lyrics => {
      dep_of => "LyricVersion",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Track => {
      dep_of => "Lyrics",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Lyrics => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "Lyrics",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Money => {},
  NoPrimaryKey => {},
  OneKey => {},
  Owners => {},
  Producer => {},
  SelfRef => {},
  SelfRefAlias => {
    SelfRef => {
      dep_of => "SelfRefAlias",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    }
  },
  Serialized => {},
  SourceNameArtists => {},
  Tag => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Tag",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  TimestampPrimaryKey => {},
  Track => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  TreeLike => {},
  TwoKeyTreeLike => {},
  TypedObject => {}
},'got correct source tree for type => tables w/ exclude_sources');

is_deeply(
[$schema->dep_ordered_sources(
  type => 'tables', uniq_from => 1, deploy_only => 1
)],[
  "CustomSql",
  "Artist",
  "BindType",
  "Bookmark",
  "Collection",
  "Dummy",
  "Employee",
  "Encoded",
  "Event",
  "FourKeys",
  "Genre",
  "Link",
  "Money",
  "NoPrimaryKey",
  "OneKey",
  "Owners",
  "Producer",
  "SelfRef",
  "SequenceTest",
  "Serialized",
  "TimestampPrimaryKey",
  "TreeLike",
  "TwoKeyTreeLike",
  "TypedObject",
  "ArtistUndirectedMap",
  "BooksInLibrary",
  "CD",
  "CollectionObject",
  "ForceForeign",
  "SelfRefAlias",
  "Artwork",
  "CD_to_Producer",
  "LinerNotes",
  "Tag",
  "Track",
  "TwoKeys",
  "Artwork_to_Artist",
  "FourKeys_to_TwoKeys",
  "Image",
  "Lyrics",
  "LyricVersion"
]
,"got correct source table deploy order from dep_ordered_sources()");

######################
######################

use ViewDeps;
my $schema2 = ViewDeps->connect('dbi:SQLite::memory:');

is_deeply($schema2->source_tree( type => 'views', limit_deps => 1 ),{
  ANameArtists => {},
  AbNameArtists => {
    ANameArtists => {
      dep_of => "AbNameArtists",
      deploy_dep => 1,
      depth => 0,
      for_view => 1,
      hard => 0,
      is_view => 1
    }
  },
  AbaNameArtists => {
    ANameArtists => {
      dep_of => "AbNameArtists",
      deploy_dep => 1,
      depth => 1,
      for_view => 1,
      hard => 0,
      is_view => 1
    },
    AbNameArtists => {
      dep_of => "AbaNameArtists",
      deploy_dep => 1,
      depth => 0,
      for_view => 1,
      hard => 0,
      is_view => 1
    }
  },
  AbaNameArtistsAnd2010CDsWithManyTracks => {
    ANameArtists => {
      dep_of => "AbNameArtists",
      deploy_dep => 1,
      depth => 1,
      for_view => 1,
      hard => 0,
      is_view => 1
    },
    AbNameArtists => {
      dep_of => "AbaNameArtistsAnd2010CDsWithManyTracks",
      deploy_dep => 1,
      depth => 0,
      for_view => 1,
      hard => 0,
      is_view => 1
    },
    Year2010CDs => {
      dep_of => "Year2010CDsWithManyTracks",
      deploy_dep => 1,
      depth => 1,
      for_view => 1,
      hard => 0,
      is_view => 1
    },
    Year2010CDsWithManyTracks => {
      dep_of => "AbaNameArtistsAnd2010CDsWithManyTracks",
      deploy_dep => 1,
      depth => 0,
      for_view => 1,
      hard => 0,
      is_view => 1
    }
  },
  TrackNumberFives => {},
  Year2010CDs => {},
  Year2010CDsWithManyTracks => {
    Year2010CDs => {
      dep_of => "Year2010CDsWithManyTracks",
      deploy_dep => 1,
      depth => 0,
      for_view => 1,
      hard => 0,
      is_view => 1
    }
  }
}, 'ViewDeps source_tree w/ limit_deps on');

is_deeply([$schema2->dep_ordered_sources( type => 'views', limit_deps => 1 )],[
  "ANameArtists",
  "TrackNumberFives",
  "Year2010CDs",
  "AbNameArtists",
  "Year2010CDsWithManyTracks",
  "AbaNameArtists",
  "AbaNameArtistsAnd2010CDsWithManyTracks"
], "got correct deploy order for ViewDeps views");


throws_ok {
  $schema->source_tree({
    type => 'views',
    limit_sources => ['Year2000CDs','BadSourceName']
  })
  } qr/unknown source/,
  "Non-existant source in limit_sources throws exception";

throws_ok {
  $schema->source_tree({
    type => 'blah',
  })
  } qr/bad type/,
  "Bad 'type' throws exception";

throws_ok {
  $schema->source_tree({
    foo => 'bar',
  })
  } qr/Unknown option/,
  "Unknown option throws exception";

is_deeply($schema->source_tree( type => 'all', include_self => 1 ),{
  Artist => {},
  ArtistSubclass => {},
  ArtistUndirectedMap => {
    Artist => {
      dep_of => "ArtistUndirectedMap",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    }
  },
  Artwork => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Artwork",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    }
  },
  Artwork_to_Artist => {
    Artist => {
      dep_of => "Artwork_to_Artist",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    Artwork => {
      dep_of => "Artwork_to_Artist",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Artwork",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    }
  },
  BindType => {},
  Bookmark => {
    Link => {
      dep_of => "Bookmark",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    }
  },
  BooksInLibrary => {
    Owners => {
      dep_of => "BooksInLibrary",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    }
  },
  CD => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    }
  },
  CD_to_Producer => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    CD => {
      dep_of => "CD_to_Producer",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Producer => {
      dep_of => "CD_to_Producer",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    }
  },
  Collection => {},
  CollectionObject => {
    Collection => {
      dep_of => "CollectionObject",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    TypedObject => {
      dep_of => "CollectionObject",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    }
  },
  CustomSql => {},
  Dummy => {},
  Employee => {
    Encoded => {
      dep_of => "Employee",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    }
  },
  Encoded => {},
  Event => {},
  EventTZ => {},
  ForceForeign => {
    Artist => {
      dep_of => "ForceForeign",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    }
  },
  FourKeys => {},
  FourKeys_to_TwoKeys => {
    Artist => {
      dep_of => "TwoKeys",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    CD => {
      dep_of => "TwoKeys",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    FourKeys => {
      dep_of => "FourKeys_to_TwoKeys",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    TwoKeys => {
      dep_of => "FourKeys_to_TwoKeys",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    }
  },
  Genre => {},
  Image => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    Artwork => {
      dep_of => "Image",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Artwork",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    }
  },
  LinerNotes => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    CD => {
      dep_of => "LinerNotes",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    }
  },
  Link => {},
  LyricVersion => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 3,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Lyrics => {
      dep_of => "LyricVersion",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    Track => {
      dep_of => "Lyrics",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    }
  },
  Lyrics => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Track => {
      dep_of => "Lyrics",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    }
  },
  Money => {},
  NoPrimaryKey => {},
  OneKey => {},
  Owners => {},
  Producer => {},
  SelfRef => {},
  SelfRefAlias => {
    SelfRef => {
      dep_of => "SelfRefAlias",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    }
  },
  SequenceTest => {},
  Serialized => {},
  SourceNameArtists => {},
  Tag => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Tag",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    }
  },
  TimestampPrimaryKey => {},
  Track => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    }
  },
  TreeLike => {
    TreeLike => {
      dep_of => "TreeLike",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_self => 1,
      is_view => 0
    }
  },
  TwoKeyTreeLike => {
    TwoKeyTreeLike => {
      dep_of => "TwoKeyTreeLike",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_self => 1,
      is_view => 0
    }
  },
  TwoKeys => {
    Artist => {
      dep_of => "TwoKeys",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    CD => {
      dep_of => "TwoKeys",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    }
  },
  TypedObject => {},
  Year1999CDs => {
    Artist => {
      dep_of => "Year1999CDs",
      deploy_dep => 1,
      depth => 0,
      for_view => 1,
      hard => 1,
      is_self => 0,
      is_view => 0
    }
  },
  Year2000CDs => {
    Artist => {
      dep_of => "Year2000CDs",
      deploy_dep => 1,
      depth => 0,
      for_view => 1,
      hard => 1,
      is_self => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "Year2000CDs",
      deploy_dep => 0,
      depth => 0,
      for_view => 1,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Track => {
      dep_of => "Year2000CDs",
      deploy_dep => 0,
      depth => 0,
      for_view => 1,
      hard => 0,
      is_self => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_self => 0,
      is_view => 1
    }
  }
}, 'got correct source tree with everything (type \'all\' + self references)');

is_deeply($schema->source_tree(
  type => 'all', include_check => sub { $_->{hard} ne $_->{deploy_dep} }
),{
  Artist => {},
  ArtistSubclass => {},
  ArtistUndirectedMap => {},
  Artwork => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Artwork_to_Artist => {
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  BindType => {},
  Bookmark => {},
  BooksInLibrary => {},
  CD => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  CD_to_Producer => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Collection => {},
  CollectionObject => {},
  CustomSql => {},
  Dummy => {},
  Employee => {},
  Encoded => {},
  Event => {},
  EventTZ => {},
  ForceForeign => {},
  FourKeys => {},
  FourKeys_to_TwoKeys => {
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Genre => {},
  Image => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  LinerNotes => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Link => {},
  LyricVersion => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 3,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Lyrics => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 2,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Money => {},
  NoPrimaryKey => {},
  OneKey => {},
  Owners => {},
  Producer => {},
  SelfRef => {},
  SelfRefAlias => {},
  SequenceTest => {},
  Serialized => {},
  SourceNameArtists => {},
  Tag => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  TimestampPrimaryKey => {},
  Track => {
    Artist => {
      dep_of => "CD",
      deploy_dep => 0,
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  TreeLike => {},
  TwoKeyTreeLike => {},
  TwoKeys => {
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  TypedObject => {},
  Year1999CDs => {},
  Year2000CDs => {
    CD => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      deploy_dep => 1,
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  }
}, 'deps where \'hard\' != \'deploy_dep\' (using \'include_check\' coderef)');

done_testing;
