Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAC15785EE
	for <lists+nbd@lfdr.de>; Mon, 18 Jul 2022 16:57:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4DC3D203CD; Mon, 18 Jul 2022 14:57:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jul 18 14:57:12 2022
Old-Return-Path: <joe@perches.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SARE_MSGID_LONG40,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AD05B203D4
	for <lists-other-nbd@bendel.debian.org>; Mon, 18 Jul 2022 14:40:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.35 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, SARE_MSGID_LONG40=0.637,
	T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qxKlXE7IJQlE for <lists-other-nbd@bendel.debian.org>;
	Mon, 18 Jul 2022 14:40:51 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL16_SUBNET=-0.41 (check from: .perches. - helo: .relay.hostedemail. - helo-domain: .hostedemail.)  FROM/MX_MATCHES_UNVR_HELO(DOMAIN)_OR_CL_NAME(DOMAIN)=-1.5 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -4.66
X-Greylist: delayed 501 seconds by postgrey-1.36 at bendel; Mon, 18 Jul 2022 14:40:51 UTC
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 2F5F62038A
	for <nbd@other.debian.org>; Mon, 18 Jul 2022 14:40:49 +0000 (UTC)
Received: from omf02.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay11.hostedemail.com (Postfix) with ESMTP id 5B8778091B;
	Mon, 18 Jul 2022 14:32:24 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf02.hostedemail.com (Postfix) with ESMTPA id C991F80013;
	Mon, 18 Jul 2022 14:32:22 +0000 (UTC)
Message-ID: <49a8099eb7dd01e9d2d190056171341d87cd442b.camel@perches.com>
Subject: Re: [PATCH] nbd: add missing definition of pr_fmt
From: Joe Perches <joe@perches.com>
To: Yu Kuai <yukuai1@huaweicloud.com>, josef@toxicpanda.com,
 axboe@kernel.dk,  houtao1@huawei.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
	linux-kernel@vger.kernel.org, yi.zhang@huawei.com
Date: Mon, 18 Jul 2022 07:32:21 -0700
In-Reply-To: <853a5164-78cf-1ccb-8e18-cff5b5bce4ff@huaweicloud.com>
References: <20220706093320.1962871-1-yukuai1@huaweicloud.com>
	 <853a5164-78cf-1ccb-8e18-cff5b5bce4ff@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Stat-Signature: zn5wsm8bu3ibsfq9fmhf1s3698hxhkmh
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: C991F80013
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19u1lF+U+u5u4KTIb69mjPigTZKoouq7xY=
X-HE-Tag: 1658154742-75497
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XpcYdq0GSAJ.A.NaB.ITX1iB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2192
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/49a8099eb7dd01e9d2d190056171341d87cd442b.camel@perches.com
Resent-Date: Mon, 18 Jul 2022 14:57:12 +0000 (UTC)

On Mon, 2022-07-18 at 21:52 +0800, Yu Kuai wrote:
> =E5=9C=A8 2022/07/06 17:33, Yu Kuai =E5=86=99=E9=81=93:
> > From: Yu Kuai <yukuai3@huawei.com>
> >=20
> > commit 1243172d5894 ("nbd: use pr_err to output error message") tries
> > to define pr_fmt and use short pr_err() to output error message,
> > however, the definition is missed.
>=20
> friendly ping ...
[]
> > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
[]
> > @@ -44,6 +44,9 @@
> >   #include <linux/nbd-netlink.h>
> >   #include <net/genetlink.h>
> >  =20
> > +#undef pr_fmt
> > +#define pr_fmt(fmt) "nbd: " fmt
> > +

Typically, this #define is place before all #include lines
so there is no need for an #undef

