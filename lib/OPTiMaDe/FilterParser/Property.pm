package OPTiMaDe::FilterParser::Property;

use strict;
use warnings;

sub new {
    my( $class ) = @_;
    return bless { name => [] }, $class;
}

sub push_identifier {
    my( $self, $identifier ) = @_;
    push @{$self->{name}}, $identifier;
}

sub to_filter
{
    my( $self ) = @_;
    return join '.', @{$self->{name}};
}

sub to_SQL
{
    my( $self, $delim ) = @_;
    $delim = "'" unless $delim;

    return join '.', map { "${delim}$_${delim}" } @{$self->{name}};
}

sub modify
{
    my( $self, $code ) = @_;
    return $code->( $self );
}

1;
