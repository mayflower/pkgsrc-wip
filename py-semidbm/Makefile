# $NetBSD: Makefile,v 1.2 2015/08/05 21:44:33 jihbed Exp $

DISTNAME=	semidbm-0.5.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	databases python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/semidbm/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://files.pythonhosted.org/packages/source/s/semidbm/
COMMENT=	Cross platform (fast) DBM interface in python
LICENSE=	modified-bsd

WRKSRC=		${WRKDIR}/semidbm-0.5.1

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
