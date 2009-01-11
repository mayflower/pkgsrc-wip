# $NetBSD: buildlink3.mk,v 1.4 2009/01/11 09:28:43 phonohawk Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
GHC_BUILDLINK3_MK:=	${GHC_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	ghc
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nghc}
BUILDLINK_PACKAGES+=	ghc
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}ghc

.if !empty(GHC_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.ghc+=	ghc>=6.10.1
BUILDLINK_ABI_DEPENDS.ghc?=	ghc>=6.10.1
BUILDLINK_PKGSRCDIR.ghc?=	../../wip/ghc

BUILDLINK_DEPMETHOD.ghc?=	build
.endif	# GHC_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}

# We include gmp/buildlink3.mk here so that "gmp" is registered as a
# direct dependency for any package that includes this buildlink3.mk
# to get ghc as a build dependency.  This is needed since software
# built by ghc requires routines from the "gmp" shared library.
#
.include "../../devel/gmp/buildlink3.mk"
