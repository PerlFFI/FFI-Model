package FFI::Model;

use strict;
use warnings;
use 5.032;

# ABSTRACT: Model for FFI generated code
# VERSION

package FFI::Model::Type;

package FFI::Model::Constant {
  use Moose;

  has name => (
    is => 'rw',
    isa => 'Str',
    required => 1,
  );

  has value => (
    is => 'rw',
    required => 1,
  );

  has type => (
    is => 'rw',
    isa => 'Str',
    required => 'rw',
  );
}

package FFI::Model::Enum {
  use Moose;
  extends 'FFI::Model::Type';
}


package FFI::Model::Record {
  use Moose;
  extends 'FFI::Model::Type';
}

package FFI::Model::Struct {
  use Moose;
  extends 'FFI::Model::Type';
}

package FFI::Model::Union {
  use Moose;
  extends 'FFI::Model::Type';
}

package FFI::Model::ArrayStruct {
  use Moose;
  extends 'FFI::Model::Type';
}

package FFI::Model::ArrayUnion {
  use Moose;
  extends 'FFI::Model::Type';
}

package FFI::Model::Closure {
  use Moose;
  extends 'FFI::Model::Type';
}

package FFI::Model::Function {
  use Moose;
  use experimental qw( signatures );

  has name => (
    is       => 'rw',
    isa      => 'Str',
    required => 1,
  );

  has symbol => (
    is      => 'rw',
    isa     => 'Str',
    lazy    => 1,
    default => sub ($self) {
      $self->name;
    },
  );

  has return_type => (
    is  => 'rw',
    isa => 'FFI::Model::Type',
  );

  has argument_types => (
    is  => 'ro',
    isa => 'ArrayRef[FFI::Model::Type]',
  );

  has ignore_not_found => (
    is  => 'rw',
    isa => 'Bool',
  );
}

package FFI::Model::Lib {
  use Moose;

  has api => (
    is => 'ro',
    isa => 'Int',
    lazy => 1,
    default => sub { 1 },
  );

  has lib => (
    is => 'ro',
    # TODO: should also support undef
    isa => 'ArrayRef[Str]',
    lazy => 1,
    default => sub { [] },
  );

  has alien => (
    is => 'ro',
    isa => 'ArrayRef[Str]',
    lazy => 1,
    default => sub { [] },
  );

  has lang => (
    is => 'ro',
    isa => 'Str',
    lazy => 1,
    default => sub { 'C' }
  );

  has bundle => (
    is  => 'ro',
    isa => 'Bool',
    default => sub { '' },
  );

  has abi => (
    is => 'ro',
    isa => 'Str',
    default => sub { '' },
  );

  has functions => (
    is => 'ro',
    isa => 'ArrayRef[FFI::Model::Function]',
    lazy => 1,
    default => sub { [] },
  );

  has constants => (
    is => 'ro',
    isa => 'ArrayRef[FFI::Model::Constant]',
    lazy => 1,
    default => sub { [] },
  );
}

1;
