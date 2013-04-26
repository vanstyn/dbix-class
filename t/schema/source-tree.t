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
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  Artwork => {
    CD => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0,
      is_view => 0
    }
  },
  Artwork_to_Artist => {
    Artist => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Artwork => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    CD => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 2,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 2,
      for_view => 0,
      is_view => 0
    }
  },
  BindType => {},
  Bookmark => {
    Link => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  BooksInLibrary => {
    Owners => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  CD => {
    Genre => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  CD_to_Producer => {
    CD => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Producer => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0,
      is_view => 0
    }
  },
  Collection => {},
  CollectionObject => {
    Collection => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    TypedObject => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  CustomSql => {},
  Dummy => {},
  Employee => {
    Encoded => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  Encoded => {},
  Event => {},
  EventTZ => {},
  ForceForeign => {
    Artist => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  FourKeys => {},
  FourKeys_to_TwoKeys => {
    Artist => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    CD => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    FourKeys => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 2,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 2,
      for_view => 0,
      is_view => 0
    },
    TwoKeys => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  Genre => {},
  Image => {
    Artwork => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    CD => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 2,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 2,
      for_view => 0,
      is_view => 0
    }
  },
  LinerNotes => {
    CD => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0,
      is_view => 0
    }
  },
  Link => {},
  LyricVersion => {
    CD => {
      depth => 2,
      for_view => 0,
      is_view => 0
    },
    Lyrics => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Year1999CDs => {
      depth => 2,
      for_view => 0,
      is_view => 1
    },
    Year2000CDs => {
      depth => 2,
      for_view => 0,
      is_view => 1
    }
  },
  Lyrics => {
    CD => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Year1999CDs => {
      depth => 1,
      for_view => 0,
      is_view => 1
    },
    Year2000CDs => {
      depth => 1,
      for_view => 0,
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
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  SequenceTest => {},
  Serialized => {},
  SourceNameArtists => {},
  Tag => {
    CD => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0,
      is_view => 0
    }
  },
  TimestampPrimaryKey => {},
  Track => {
    CD => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Year1999CDs => {
      depth => 0,
      for_view => 0,
      is_view => 1
    },
    Year2000CDs => {
      depth => 0,
      for_view => 0,
      is_view => 1
    }
  },
  TreeLike => {},
  TwoKeyTreeLike => {},
  TwoKeys => {
    Artist => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    CD => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0,
      is_view => 0
    }
  },
  TypedObject => {}
}, 'got correct default source tree');

is_deeply($schema->source_tree( type => 'views' ),{
  Year1999CDs => {
    Artist => {
      depth => 0,
      for_view => 1,
      is_view => 0
    }
  },
  Year2000CDs => {
    Artist => {
      depth => 0,
      for_view => 1,
      is_view => 0
    },
    Genre => {
      depth => 0,
      for_view => 1,
      is_view => 0
    },
    Track => {
      depth => 0,
      for_view => 1,
      is_view => 0
    }
  }
},'got correct source tree for type => views');

is_deeply($schema->source_tree( type => 'all' ),{
  Artist => {},
  ArtistSubclass => {},
  ArtistUndirectedMap => {
    Artist => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  Artwork => {
    CD => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0,
      is_view => 0
    }
  },
  Artwork_to_Artist => {
    Artist => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Artwork => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    CD => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 2,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 2,
      for_view => 0,
      is_view => 0
    }
  },
  BindType => {},
  Bookmark => {
    Link => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  BooksInLibrary => {
    Owners => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  CD => {
    Genre => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  CD_to_Producer => {
    CD => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Producer => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0,
      is_view => 0
    }
  },
  Collection => {},
  CollectionObject => {
    Collection => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    TypedObject => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  CustomSql => {},
  Dummy => {},
  Employee => {
    Encoded => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  Encoded => {},
  Event => {},
  EventTZ => {},
  ForceForeign => {
    Artist => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  FourKeys => {},
  FourKeys_to_TwoKeys => {
    Artist => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    CD => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    FourKeys => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 2,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 2,
      for_view => 0,
      is_view => 0
    },
    TwoKeys => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  Genre => {},
  Image => {
    Artwork => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    CD => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 2,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 2,
      for_view => 0,
      is_view => 0
    }
  },
  LinerNotes => {
    CD => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0,
      is_view => 0
    }
  },
  Link => {},
  LyricVersion => {
    Artist => {
      depth => 3,
      for_view => 1,
      is_view => 0
    },
    CD => {
      depth => 2,
      for_view => 0,
      is_view => 0
    },
    Lyrics => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Year1999CDs => {
      depth => 2,
      for_view => 0,
      is_view => 1
    },
    Year2000CDs => {
      depth => 2,
      for_view => 0,
      is_view => 1
    }
  },
  Lyrics => {
    Artist => {
      depth => 2,
      for_view => 1,
      is_view => 0
    },
    CD => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Year1999CDs => {
      depth => 1,
      for_view => 0,
      is_view => 1
    },
    Year2000CDs => {
      depth => 1,
      for_view => 0,
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
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  SequenceTest => {},
  Serialized => {},
  SourceNameArtists => {},
  Tag => {
    CD => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0,
      is_view => 0
    }
  },
  TimestampPrimaryKey => {},
  Track => {
    Artist => {
      depth => 1,
      for_view => 1,
      is_view => 0
    },
    CD => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Year1999CDs => {
      depth => 0,
      for_view => 0,
      is_view => 1
    },
    Year2000CDs => {
      depth => 0,
      for_view => 0,
      is_view => 1
    }
  },
  TreeLike => {},
  TwoKeyTreeLike => {},
  TwoKeys => {
    Artist => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    CD => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0,
      is_view => 0
    }
  },
  TypedObject => {},
  Year1999CDs => {
    Artist => {
      depth => 0,
      for_view => 1,
      is_view => 0
    }
  },
  Year2000CDs => {
    Artist => {
      depth => 0,
      for_view => 1,
      is_view => 0
    },
    Genre => {
      depth => 0,
      for_view => 1,
      is_view => 0
    },
    Track => {
      depth => 0,
      for_view => 1,
      is_view => 0
    }
  }
},'got correct source tree for type => all');

is_deeply($schema->source_tree({ type => 'views', limit_sources => ['Year2000CDs'] }),{
  Year2000CDs => {
    Artist => {
      depth => 0,
      for_view => 1,
      is_view => 0
    },
    Genre => {
      depth => 0,
      for_view => 1,
      is_view => 0
    },
    Track => {
      depth => 0,
      for_view => 1,
      is_view => 0
    }
  }
},'got correct source tree for type => views w/ limit_sources');

is_deeply($schema->source_tree( type => 'tables', exclude_sources => [qw(SequenceTest TwoKeys)] ),{
  Artist => {},
  ArtistSubclass => {},
  ArtistUndirectedMap => {
    Artist => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  Artwork => {
    CD => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0,
      is_view => 0
    }
  },
  Artwork_to_Artist => {
    Artist => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Artwork => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    CD => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 2,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 2,
      for_view => 0,
      is_view => 0
    }
  },
  BindType => {},
  Bookmark => {
    Link => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  BooksInLibrary => {
    Owners => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  CD => {
    Genre => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  CD_to_Producer => {
    CD => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Producer => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0,
      is_view => 0
    }
  },
  Collection => {},
  CollectionObject => {
    Collection => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    TypedObject => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  CustomSql => {},
  Dummy => {},
  Employee => {
    Encoded => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  Encoded => {},
  Event => {},
  EventTZ => {},
  ForceForeign => {
    Artist => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  FourKeys => {},
  FourKeys_to_TwoKeys => {
    FourKeys => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    TwoKeys => {
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  Genre => {},
  Image => {
    Artwork => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    CD => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 2,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 2,
      for_view => 0,
      is_view => 0
    }
  },
  LinerNotes => {
    CD => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0,
      is_view => 0
    }
  },
  Link => {},
  LyricVersion => {
    CD => {
      depth => 2,
      for_view => 0,
      is_view => 0
    },
    Lyrics => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Year1999CDs => {
      depth => 2,
      for_view => 0,
      is_view => 1
    },
    Year2000CDs => {
      depth => 2,
      for_view => 0,
      is_view => 1
    }
  },
  Lyrics => {
    CD => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Year1999CDs => {
      depth => 1,
      for_view => 0,
      is_view => 1
    },
    Year2000CDs => {
      depth => 1,
      for_view => 0,
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
      depth => 0,
      for_view => 0,
      is_view => 0
    }
  },
  Serialized => {},
  SourceNameArtists => {},
  Tag => {
    CD => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Genre => {
      depth => 1,
      for_view => 0,
      is_view => 0
    },
    Track => {
      depth => 1,
      for_view => 0,
      is_view => 0
    }
  },
  TimestampPrimaryKey => {},
  Track => {
    CD => {
      depth => 0,
      for_view => 0,
      is_view => 0
    },
    Year1999CDs => {
      depth => 0,
      for_view => 0,
      is_view => 1
    },
    Year2000CDs => {
      depth => 0,
      for_view => 0,
      is_view => 1
    }
  },
  TreeLike => {},
  TwoKeyTreeLike => {},
  TypedObject => {}
},'got correct source tree for type => tables w/ exclude_sources');


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


# We probably also want a "collapsed" tree thingy

done_testing;
