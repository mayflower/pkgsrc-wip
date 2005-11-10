# $NetBSD: buildlink3.mk,v 1.7 2005/11/10 01:57:02 jeremy-c-reed Exp $
#
# This Makefile fragment is included by packages that use libX11.

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBX11_BUILDLINK3_MK:=	${LIBX11_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libX11
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:NlibX11}
BUILDLINK_PACKAGES+=	libX11

.if !empty(LIBX11_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.libX11+=		libX11>=0.99.0
BUILDLINK_PKGSRCDIR.libX11?=		../../wip/libX11
.endif # LIBX11_BUILDLINK3_MK

.include "../../mk/pthread.buildlink3.mk"
LIBS+=		${BUILDLINK_LDADD.pthread}

.include "../../wip/xproto/buildlink3.mk"
#.include "../../wip/xtrans/buildlink3.mk"
#.include "../../wip/libXau/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
