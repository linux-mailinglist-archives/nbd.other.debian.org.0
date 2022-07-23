Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 294A357EBAD
	for <lists+nbd@lfdr.de>; Sat, 23 Jul 2022 05:30:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DC5B72057D; Sat, 23 Jul 2022 03:30:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Jul 23 03:30:09 2022
Old-Return-Path: <joe@perches.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,SARE_MSGID_LONG40,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3B1A520576
	for <lists-other-nbd@bendel.debian.org>; Sat, 23 Jul 2022 03:12:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.352 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, SARE_MSGID_LONG40=0.637,
	T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qRxT8QiAOKZF for <lists-other-nbd@bendel.debian.org>;
	Sat, 23 Jul 2022 03:12:48 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL16_SUBNET=-0.41 (check from: .perches. - helo: .relay.hostedemail. - helo-domain: .hostedemail.)  FROM/MX_MATCHES_UNVR_HELO(DOMAIN)_OR_CL_NAME(DOMAIN)=-1.5 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -4.66
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 073C520567
	for <nbd@other.debian.org>; Sat, 23 Jul 2022 03:12:46 +0000 (UTC)
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id EB98E80E78;
	Sat, 23 Jul 2022 03:12:41 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf01.hostedemail.com (Postfix) with ESMTPA id 4EA3B60009;
	Sat, 23 Jul 2022 03:12:40 +0000 (UTC)
Message-ID: <c4cf82073cccd574aa75b3a8e1f15748929c7621.camel@perches.com>
Subject: Re: [PATCH] nbd: add missing definition of pr_fmt
From: Joe Perches <joe@perches.com>
To: Yu Kuai <yukuai1@huaweicloud.com>, Yu Kuai <yukuai3@huawei.com>, 
	josef@toxicpanda.com, axboe@kernel.dk, houtao1@huawei.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
	linux-kernel@vger.kernel.org, yi.zhang@huawei.com
Date: Fri, 22 Jul 2022 20:12:39 -0700
In-Reply-To: <ec031ff1-3936-92ce-b66b-59e3e6a289ab@huaweicloud.com>
References: <20220706093320.1962871-1-yukuai1@huaweicloud.com>
	 <853a5164-78cf-1ccb-8e18-cff5b5bce4ff@huaweicloud.com>
	 <49a8099eb7dd01e9d2d190056171341d87cd442b.camel@perches.com>
	 <0dba2f0c-ba02-853e-60e7-873eabedcd80@huaweicloud.com>
	 <ec031ff1-3936-92ce-b66b-59e3e6a289ab@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Stat-Signature: xfaxua7y53z6efctdo35e56im6uo765i
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 4EA3B60009
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19vOmEdMuAg3rJ8m6FNkvIgGhqamKHXogU=
X-HE-Tag: 1658545960-341427
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <fNgD56Y_PTP.A.JxE.Bt22iB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2200
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/c4cf82073cccd574aa75b3a8e1f15748929c7621.camel@perches.com
Resent-Date: Sat, 23 Jul 2022 03:30:09 +0000 (UTC)

On Sat, 2022-07-23 at 10:15 +0800, Yu Kuai wrote:
> Hi!

Hello.

> =E5=9C=A8 2022/07/20 19:46, Yu Kuai =E5=86=99=E9=81=93:
> > =E5=9C=A8 2022/07/18 22:32, Joe Perches =E5=86=99=E9=81=93:
> > > On Mon, 2022-07-18 at 21:52 +0800, Yu Kuai wrote:
> > > > =E5=9C=A8 2022/07/06 17:33, Yu Kuai =E5=86=99=E9=81=93:
> > > > > From: Yu Kuai <yukuai3@huawei.com>
> > > > >=20
> > > > > commit 1243172d5894 ("nbd: use pr_err to output error message") t=
ries
> > > > > to define pr_fmt and use short pr_err() to output error message,
> > > > > however, the definition is missed.
> > > > friendly ping ...
> > > []
> > > > > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > > []
> > > > > @@ -44,6 +44,9 @@
> > > > > =C2=A0=C2=A0 #include <linux/nbd-netlink.h>
> > > > > =C2=A0=C2=A0 #include <net/genetlink.h>
> > > > > +#undef pr_fmt
> > > > > +#define pr_fmt(fmt) "nbd: " fmt
> > > > > +
> > > Typically, this #define is place before all #include lines
> > > so there is no need for an #undef
>=20
> I tried to remove the #undef:

I'll repeat my message.

Move the #define before _any_ #include.

Also, there are some message that would need existing "nbd: " output
prefixes removed.
---
 drivers/block/nbd.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index f5d098a148cbf..222f26ac5e96a 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -11,6 +11,8 @@
  * (part of code stolen from loop.c)
  */
=20
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/major.h>
=20
 #include <linux/blkdev.h>
@@ -1950,8 +1952,8 @@ static int nbd_genl_connect(struct sk_buff *skb, stru=
ct genl_info *info)
 			     test_bit(NBD_DISCONNECT_REQUESTED, &nbd->flags)) ||
 			    !refcount_inc_not_zero(&nbd->refs)) {
 				mutex_unlock(&nbd_index_mutex);
-				pr_err("nbd: device at index %d is going down\n",
-					index);
+				pr_err("device at index %d is going down\n",
+				       index);
 				return -EINVAL;
 			}
 		}
@@ -1961,7 +1963,7 @@ static int nbd_genl_connect(struct sk_buff *skb, stru=
ct genl_info *info)
 	if (!nbd) {
 		nbd =3D nbd_dev_add(index, 2);
 		if (IS_ERR(nbd)) {
-			pr_err("nbd: failed to add new device\n");
+			pr_err("failed to add new device\n");
 			return PTR_ERR(nbd);
 		}
 	}

