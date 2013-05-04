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
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    }
  },
  Artwork => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 3,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Artwork",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Artwork_to_Artist => {
    Artist => {
      dep_of => "Artwork_to_Artist",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Artwork => {
      dep_of => "Artwork_to_Artist",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Artwork",
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
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
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 0
    }
  },
  BooksInLibrary => {
    Owners => {
      dep_of => "BooksInLibrary",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    }
  },
  CD => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 2,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  CD_to_Producer => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 3,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    CD => {
      dep_of => "CD_to_Producer",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Producer => {
      dep_of => "CD_to_Producer",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
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
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    TypedObject => {
      dep_of => "CollectionObject",
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
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "TwoKeys",
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    FourKeys => {
      dep_of => "FourKeys_to_TwoKeys",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    TwoKeys => {
      dep_of => "FourKeys_to_TwoKeys",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Genre => {},
  Image => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 4,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    Artwork => {
      dep_of => "Image",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Artwork",
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  LinerNotes => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 3,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    CD => {
      dep_of => "LinerNotes",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Link => {},
  LyricVersion => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 3,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Lyrics => {
      dep_of => "LyricVersion",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Track => {
      dep_of => "Lyrics",
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Lyrics => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 2,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "Lyrics",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
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
      dep_of => "Year1999CDs",
      depth => 3,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Tag",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  TimestampPrimaryKey => {},
  Track => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 1,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
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
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "TwoKeys",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
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
      depth => 0,
      for_view => 1,
      hard => 1,
      is_view => 0
    }
  },
  Year2000CDs => {
    Artist => {
      dep_of => "Year2000CDs",
      depth => 0,
      for_view => 1,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "Year2000CDs",
      depth => 0,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "Year2000CDs",
      depth => 0,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
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
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    }
  },
  Artwork => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 3,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Artwork",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Artwork_to_Artist => {
    Artist => {
      dep_of => "Artwork_to_Artist",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Artwork => {
      dep_of => "Artwork_to_Artist",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Artwork",
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
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
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 0
    }
  },
  BooksInLibrary => {
    Owners => {
      dep_of => "BooksInLibrary",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    }
  },
  CD => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 2,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  CD_to_Producer => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 3,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    CD => {
      dep_of => "CD_to_Producer",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Producer => {
      dep_of => "CD_to_Producer",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
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
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    TypedObject => {
      dep_of => "CollectionObject",
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
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "TwoKeys",
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    FourKeys => {
      dep_of => "FourKeys_to_TwoKeys",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    TwoKeys => {
      dep_of => "FourKeys_to_TwoKeys",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Genre => {},
  Image => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 4,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    Artwork => {
      dep_of => "Image",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Artwork",
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  LinerNotes => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 3,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    CD => {
      dep_of => "LinerNotes",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Link => {},
  LyricVersion => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 3,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Lyrics => {
      dep_of => "LyricVersion",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Track => {
      dep_of => "Lyrics",
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Lyrics => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 2,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "Lyrics",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
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
      dep_of => "Year1999CDs",
      depth => 3,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Tag",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  TimestampPrimaryKey => {},
  Track => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 1,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
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
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "TwoKeys",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
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
      depth => 0,
      for_view => 1,
      hard => 1,
      is_view => 0
    }
  },
  Year2000CDs => {
    Artist => {
      dep_of => "Year2000CDs",
      depth => 0,
      for_view => 1,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "Year2000CDs",
      depth => 0,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "Year2000CDs",
      depth => 0,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
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
      depth => 0,
      for_view => 1,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "Year2000CDs",
      depth => 0,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "Year2000CDs",
      depth => 0,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
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
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    }
  },
  Artwork => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 3,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Artwork",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Artwork_to_Artist => {
    Artist => {
      dep_of => "Artwork_to_Artist",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Artwork => {
      dep_of => "Artwork_to_Artist",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Artwork",
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
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
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 0
    }
  },
  BooksInLibrary => {
    Owners => {
      dep_of => "BooksInLibrary",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    }
  },
  CD => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 2,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  CD_to_Producer => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 3,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    CD => {
      dep_of => "CD_to_Producer",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Producer => {
      dep_of => "CD_to_Producer",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
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
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    TypedObject => {
      dep_of => "CollectionObject",
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
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "TwoKeys",
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    FourKeys => {
      dep_of => "FourKeys_to_TwoKeys",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    TwoKeys => {
      dep_of => "FourKeys_to_TwoKeys",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Genre => {},
  Image => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 4,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    Artwork => {
      dep_of => "Image",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    CD => {
      dep_of => "Artwork",
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  LinerNotes => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 3,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    CD => {
      dep_of => "LinerNotes",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Link => {},
  LyricVersion => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 3,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 3,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Lyrics => {
      dep_of => "LyricVersion",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Track => {
      dep_of => "Lyrics",
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  Lyrics => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 2,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      depth => 1,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "Lyrics",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
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
      dep_of => "Year1999CDs",
      depth => 3,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Tag",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Track => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
      depth => 2,
      for_view => 0,
      hard => 0,
      is_view => 1
    }
  },
  TimestampPrimaryKey => {},
  Track => {
    Artist => {
      dep_of => "Year1999CDs",
      depth => 1,
      for_view => 1,
      hard => 0,
      is_view => 0
    },
    CD => {
      dep_of => "Track",
      depth => 0,
      for_view => 0,
      hard => 1,
      is_view => 0
    },
    Genre => {
      dep_of => "CD",
      depth => 1,
      for_view => 0,
      hard => 0,
      is_view => 0
    },
    Year1999CDs => {
      dep_of => "Track",
      depth => 0,
      for_view => 0,
      hard => 0,
      is_view => 1
    },
    Year2000CDs => {
      dep_of => "Track",
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
  type => 'tables', uniq_from => 1, hard_only => 1
)],[
  "CustomSql",
  "Artist",
  "BindType",
  "Bookmark",
  "CD",
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
  "Artwork",
  "CD_to_Producer",
  "CollectionObject",
  "ForceForeign",
  "LinerNotes",
  "SelfRefAlias",
  "Tag",
  "Track",
  "TwoKeys",
  "Artwork_to_Artist",
  "FourKeys_to_TwoKeys",
  "Image",
  "Lyrics",
  "LyricVersion"
],"got correct source hard table deploy order from dep_ordered_sources()");

######################
######################

use ViewDeps;
my $schema2 = ViewDeps->connect('dbi:SQLite::memory:');

is_deeply($schema2->source_tree( type => 'views', limit_deps => 1 ),{
  ANameArtists => {},
  AbNameArtists => {
    ANameArtists => {
      dep_of => "AbNameArtists",
      depth => 0,
      for_view => 1,
      hard => 1,
      is_view => 1
    }
  },
  AbaNameArtists => {
    ANameArtists => {
      dep_of => "AbNameArtists",
      depth => 1,
      for_view => 1,
      hard => 1,
      is_view => 1
    },
    AbNameArtists => {
      dep_of => "AbaNameArtists",
      depth => 0,
      for_view => 1,
      hard => 1,
      is_view => 1
    }
  },
  AbaNameArtistsAnd2010CDsWithManyTracks => {
    ANameArtists => {
      dep_of => "AbNameArtists",
      depth => 1,
      for_view => 1,
      hard => 1,
      is_view => 1
    },
    AbNameArtists => {
      dep_of => "AbaNameArtistsAnd2010CDsWithManyTracks",
      depth => 0,
      for_view => 1,
      hard => 1,
      is_view => 1
    },
    Year2010CDs => {
      dep_of => "Year2010CDsWithManyTracks",
      depth => 1,
      for_view => 1,
      hard => 1,
      is_view => 1
    },
    Year2010CDsWithManyTracks => {
      dep_of => "AbaNameArtistsAnd2010CDsWithManyTracks",
      depth => 0,
      for_view => 1,
      hard => 1,
      is_view => 1
    }
  },
  TrackNumberFives => {},
  Year2010CDs => {},
  Year2010CDsWithManyTracks => {
    Year2010CDs => {
      dep_of => "Year2010CDsWithManyTracks",
      depth => 0,
      for_view => 1,
      hard => 1,
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


done_testing;
