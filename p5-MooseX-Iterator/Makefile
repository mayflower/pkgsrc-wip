# $NetBSD: Makefile,v 1.1 2014/11/15 11:10:39 noud4 Exp $

DISTNAME=	MooseX-Iterator-0.11
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	2
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=../by-authors/id/R/RL/RLB/}

MAINTAINER=	noud4@users.sourceforge.net
HOMEPAGE=	https://metacpan.org/release/MooseX-Iterator
COMMENT=	Iterate over collections

DEPENDS+=	p5-Moose>0:../../devel/p5-Moose

USE_LANGUAGES+=	# empty
PERL5_PACKLIST=	auto/MooseX/Iterator/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
