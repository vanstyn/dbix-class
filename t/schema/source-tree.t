use strict;
use warnings;
use Test::More tests => 1;

use lib qw(t/lib);
use DBICTest;

my $schema = DBICTest->init_schema( no_connect => 1, no_deploy => 1 );

is_deeply($schema->source_tree(),{
  Artist => {},
  ArtistSubclass => {},
  ArtistUndirectedMap => {
    Artist => {
      distance => 1,
      hard => 1,
      type => "Table"
    }
  },
  Artwork => {
    Artist => {
      distance => 2,
      hard => 1,
      type => "Table"
    },
    CD => {
      distance => 1,
      hard => 1,
      type => "Table"
    },
    Genre => {
      distance => 2,
      hard => 0,
      type => "Table"
    },
    Track => {
      distance => 2,
      hard => 0,
      type => "Table"
    },
    Year1999CDs => {
      distance => 3,
      hard => 0,
      type => "View"
    },
    Year2000CDs => {
      distance => 3,
      hard => 0,
      type => "View"
    }
  },
  Artwork_to_Artist => {
    Artist => {
      distance => 1,
      hard => 1,
      type => "Table"
    },
    Artwork => {
      distance => 1,
      hard => 1,
      type => "Table"
    },
    CD => {
      distance => 2,
      hard => 1,
      type => "Table"
    },
    Genre => {
      distance => 3,
      hard => 0,
      type => "Table"
    },
    Track => {
      distance => 3,
      hard => 0,
      type => "Table"
    },
    Year1999CDs => {
      distance => 4,
      hard => 0,
      type => "View"
    },
    Year2000CDs => {
      distance => 4,
      hard => 0,
      type => "View"
    }
  },
  BindType => {},
  Bookmark => {
    Link => {
      distance => 1,
      hard => 0,
      type => "Table"
    }
  },
  BooksInLibrary => {
    Owners => {
      distance => 1,
      hard => 1,
      type => "Table"
    }
  },
  CD => {
    Artist => {
      distance => 1,
      hard => 1,
      type => "Table"
    },
    Genre => {
      distance => 1,
      hard => 0,
      type => "Table"
    },
    Track => {
      distance => 1,
      hard => 0,
      type => "Table"
    },
    Year1999CDs => {
      distance => 2,
      hard => 0,
      type => "View"
    },
    Year2000CDs => {
      distance => 2,
      hard => 0,
      type => "View"
    }
  },
  CD_to_Producer => {
    Artist => {
      distance => 2,
      hard => 1,
      type => "Table"
    },
    CD => {
      distance => 1,
      hard => 1,
      type => "Table"
    },
    Genre => {
      distance => 2,
      hard => 0,
      type => "Table"
    },
    Producer => {
      distance => 1,
      hard => 1,
      type => "Table"
    },
    Track => {
      distance => 2,
      hard => 0,
      type => "Table"
    },
    Year1999CDs => {
      distance => 3,
      hard => 0,
      type => "View"
    },
    Year2000CDs => {
      distance => 3,
      hard => 0,
      type => "View"
    }
  },
  Collection => {},
  CollectionObject => {
    Collection => {
      distance => 1,
      hard => 1,
      type => "Table"
    },
    TypedObject => {
      distance => 1,
      hard => 1,
      type => "Table"
    }
  },
  CustomSql => {},
  Dummy => {},
  Employee => {
    Encoded => {
      distance => 1,
      hard => 0,
      type => "Table"
    }
  },
  Encoded => {},
  Event => {},
  EventTZ => {},
  ForceForeign => {
    Artist => {
      distance => 1,
      hard => 0,
      type => "Table"
    }
  },
  FourKeys => {},
  FourKeys_to_TwoKeys => {
    Artist => {
      distance => 2,
      hard => 1,
      type => "Table"
    },
    CD => {
      distance => 2,
      hard => 1,
      type => "Table"
    },
    FourKeys => {
      distance => 1,
      hard => 1,
      type => "Table"
    },
    Genre => {
      distance => 3,
      hard => 0,
      type => "Table"
    },
    Track => {
      distance => 3,
      hard => 0,
      type => "Table"
    },
    TwoKeys => {
      distance => 1,
      hard => 1,
      type => "Table"
    },
    Year1999CDs => {
      distance => 4,
      hard => 0,
      type => "View"
    },
    Year2000CDs => {
      distance => 4,
      hard => 0,
      type => "View"
    }
  },
  Genre => {},
  Image => {
    Artist => {
      distance => 3,
      hard => 1,
      type => "Table"
    },
    Artwork => {
      distance => 1,
      hard => 1,
      type => "Table"
    },
    CD => {
      distance => 2,
      hard => 1,
      type => "Table"
    },
    Genre => {
      distance => 3,
      hard => 0,
      type => "Table"
    },
    Track => {
      distance => 3,
      hard => 0,
      type => "Table"
    },
    Year1999CDs => {
      distance => 4,
      hard => 0,
      type => "View"
    },
    Year2000CDs => {
      distance => 4,
      hard => 0,
      type => "View"
    }
  },
  LinerNotes => {
    Artist => {
      distance => 2,
      hard => 1,
      type => "Table"
    },
    CD => {
      distance => 1,
      hard => 1,
      type => "Table"
    },
    Genre => {
      distance => 2,
      hard => 0,
      type => "Table"
    },
    Track => {
      distance => 2,
      hard => 0,
      type => "Table"
    },
    Year1999CDs => {
      distance => 3,
      hard => 0,
      type => "View"
    },
    Year2000CDs => {
      distance => 3,
      hard => 0,
      type => "View"
    }
  },
  Link => {},
  LyricVersion => {
    Artist => {
      distance => 4,
      hard => 1,
      type => "Table"
    },
    CD => {
      distance => 3,
      hard => 1,
      type => "Table"
    },
    Genre => {
      distance => 4,
      hard => 0,
      type => "Table"
    },
    Lyrics => {
      distance => 1,
      hard => 1,
      type => "Table"
    },
    Track => {
      distance => 2,
      hard => 1,
      type => "Table"
    },
    Year1999CDs => {
      distance => 3,
      hard => 0,
      type => "View"
    },
    Year2000CDs => {
      distance => 3,
      hard => 0,
      type => "View"
    }
  },
  Lyrics => {
    Artist => {
      distance => 3,
      hard => 1,
      type => "Table"
    },
    CD => {
      distance => 2,
      hard => 1,
      type => "Table"
    },
    Genre => {
      distance => 3,
      hard => 0,
      type => "Table"
    },
    Track => {
      distance => 1,
      hard => 1,
      type => "Table"
    },
    Year1999CDs => {
      distance => 2,
      hard => 0,
      type => "View"
    },
    Year2000CDs => {
      distance => 2,
      hard => 0,
      type => "View"
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
      distance => 1,
      hard => 1,
      type => "Table"
    }
  },
  SequenceTest => {},
  Serialized => {},
  SourceNameArtists => {},
  Tag => {
    Artist => {
      distance => 2,
      hard => 1,
      type => "Table"
    },
    CD => {
      distance => 1,
      hard => 1,
      type => "Table"
    },
    Genre => {
      distance => 2,
      hard => 0,
      type => "Table"
    },
    Track => {
      distance => 2,
      hard => 0,
      type => "Table"
    },
    Year1999CDs => {
      distance => 3,
      hard => 0,
      type => "View"
    },
    Year2000CDs => {
      distance => 3,
      hard => 0,
      type => "View"
    }
  },
  TimestampPrimaryKey => {},
  Track => {
    Artist => {
      distance => 2,
      hard => 1,
      type => "Table"
    },
    CD => {
      distance => 1,
      hard => 1,
      type => "Table"
    },
    Genre => {
      distance => 2,
      hard => 0,
      type => "Table"
    },
    Year1999CDs => {
      distance => 1,
      hard => 0,
      type => "View"
    },
    Year2000CDs => {
      distance => 1,
      hard => 0,
      type => "View"
    }
  },
  TreeLike => {
    TreeLike => {
      distance => 0,
      hard => 0,
      type => "Table"
    }
  },
  TwoKeyTreeLike => {
    TwoKeyTreeLike => {
      distance => 0,
      hard => 1,
      type => "Table"
    }
  },
  TwoKeys => {
    Artist => {
      distance => 1,
      hard => 1,
      type => "Table"
    },
    CD => {
      distance => 1,
      hard => 1,
      type => "Table"
    },
    Genre => {
      distance => 2,
      hard => 0,
      type => "Table"
    },
    Track => {
      distance => 2,
      hard => 0,
      type => "Table"
    },
    Year1999CDs => {
      distance => 3,
      hard => 0,
      type => "View"
    },
    Year2000CDs => {
      distance => 3,
      hard => 0,
      type => "View"
    }
  },
  TypedObject => {}
},
  'got correct source tree'
);

