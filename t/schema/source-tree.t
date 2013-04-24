use strict;
use warnings;
use Test::More;

use lib qw(t/lib);
use DBICTest;

my $schema = DBICTest->init_schema( no_connect => 1, no_deploy => 1 );

use Devel::Dwarn;

is_deeply($schema->source_tree, {
  Artist => {},
  ArtistSubclass => {},
  ArtistUndirectedMap => {
    Artist => {
      depth => 0,
      for_view => 0
    }
  },
  Artwork => {
    CD => {
      depth => 0,
      for_view => 0
    },
    Genre => {
      depth => 1,
      for_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0
    }
  },
  Artwork_to_Artist => {
    Artist => {
      depth => 0,
      for_view => 0
    },
    Artwork => {
      depth => 0,
      for_view => 0
    },
    CD => {
      depth => 1,
      for_view => 0
    },
    Genre => {
      depth => 2,
      for_view => 0
    },
    Track => {
      depth => 2,
      for_view => 0
    }
  },
  BindType => {},
  Bookmark => {
    Link => {
      depth => 0,
      for_view => 0
    }
  },
  BooksInLibrary => {
    Owners => {
      depth => 0,
      for_view => 0
    }
  },
  CD => {
    Genre => {
      depth => 0,
      for_view => 0
    },
    Track => {
      depth => 0,
      for_view => 0
    }
  },
  CD_to_Producer => {
    CD => {
      depth => 0,
      for_view => 0
    },
    Genre => {
      depth => 1,
      for_view => 0
    },
    Producer => {
      depth => 0,
      for_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0
    }
  },
  Collection => {},
  CollectionObject => {
    Collection => {
      depth => 0,
      for_view => 0
    },
    TypedObject => {
      depth => 0,
      for_view => 0
    }
  },
  CustomSql => {},
  Dummy => {},
  Employee => {
    Encoded => {
      depth => 0,
      for_view => 0
    }
  },
  Encoded => {},
  Event => {},
  EventTZ => {},
  ForceForeign => {
    Artist => {
      depth => 0,
      for_view => 0
    }
  },
  FourKeys => {},
  FourKeys_to_TwoKeys => {
    Artist => {
      depth => 1,
      for_view => 0
    },
    CD => {
      depth => 1,
      for_view => 0
    },
    FourKeys => {
      depth => 0,
      for_view => 0
    },
    Genre => {
      depth => 2,
      for_view => 0
    },
    Track => {
      depth => 2,
      for_view => 0
    },
    TwoKeys => {
      depth => 0,
      for_view => 0
    }
  },
  Genre => {},
  Image => {
    Artwork => {
      depth => 0,
      for_view => 0
    },
    CD => {
      depth => 1,
      for_view => 0
    },
    Genre => {
      depth => 2,
      for_view => 0
    },
    Track => {
      depth => 2,
      for_view => 0
    }
  },
  LinerNotes => {
    CD => {
      depth => 0,
      for_view => 0
    },
    Genre => {
      depth => 1,
      for_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0
    }
  },
  Link => {},
  LyricVersion => {
    CD => {
      depth => 2,
      for_view => 0
    },
    Lyrics => {
      depth => 0,
      for_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0
    }
  },
  Lyrics => {
    CD => {
      depth => 1,
      for_view => 0
    },
    Track => {
      depth => 0,
      for_view => 0
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
      depth => 0,
      for_view => 0
    }
  },
  SequenceTest => {},
  Serialized => {},
  SourceNameArtists => {},
  Tag => {
    CD => {
      depth => 0,
      for_view => 0
    },
    Genre => {
      depth => 1,
      for_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0
    }
  },
  TimestampPrimaryKey => {},
  Track => {
    CD => {
      depth => 0,
      for_view => 0
    }
  },
  TreeLike => {},
  TwoKeyTreeLike => {},
  TwoKeys => {
    Artist => {
      depth => 0,
      for_view => 0
    },
    CD => {
      depth => 0,
      for_view => 0
    },
    Genre => {
      depth => 1,
      for_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0
    }
  },
  TypedObject => {}
}, 'got correct source tree');


# We probably also want a "collapsed" tree thingy

done_testing;
