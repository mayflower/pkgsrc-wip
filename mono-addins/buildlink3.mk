# $NetBSD: buildlink3.mk,v 1.1 2008/02/05 15:51:48 koifren Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
MONO_ADDINS_BUILDLINK3_MK:=	${MONO_ADDINS_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	mono-addins
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nmono-addins}
BUILDLINK_PACKAGES+=	mono-addins
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}mono-addins

.if ${MONO_ADDINS_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.mono-addins+=	mono-addins>=0.3
BUILDLINK_PKGSRCDIR.mono-addins?=	../../wip/mono-addins
.endif	# MONO_ADDINS_BUILDLINK3_MK

.include "../../wip/mono/buildlink3.mk"
.include "../../x11/gtk2-sharp/buildlink3.mk"

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
