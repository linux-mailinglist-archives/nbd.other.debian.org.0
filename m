Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C554317B
	for <lists+nbd@lfdr.de>; Wed, 12 Jun 2019 23:34:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1694020420; Wed, 12 Jun 2019 21:34:59 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun 12 21:34:59 2019
Old-Return-Path: <mkletzan@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,PGPSIGNATURE,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D29CA20415
	for <lists-other-nbd@bendel.debian.org>; Wed, 12 Jun 2019 21:34:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-16.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4jyMa6mSDnl6 for <lists-other-nbd@bendel.debian.org>;
	Wed, 12 Jun 2019 21:34:49 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E3FF4203C1
	for <nbd@other.debian.org>; Wed, 12 Jun 2019 21:34:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 894E030F1BB7;
	Wed, 12 Jun 2019 21:34:35 +0000 (UTC)
Received: from wheatley (ovpn-204-122.brq.redhat.com [10.40.204.122])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E68AE614C8;
	Wed, 12 Jun 2019 21:34:34 +0000 (UTC)
Received: by wheatley (Postfix, from userid 1000)
	id 461187E0068; Wed, 12 Jun 2019 23:34:33 +0200 (CEST)
Date: Wed, 12 Jun 2019 23:34:33 +0200
From: Martin Kletzander <mkletzan@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, nbd@other.debian.org, w@uter.be,
	berrange@redhat.com
Subject: Re: [PATCH v3] doc: Define a standard URI syntax for NBD URIs.
Message-ID: <20190612213433.GB19349@wheatley>
References: <20190611115330.6842-1-rjones@redhat.com>
 <20190611115330.6842-2-rjones@redhat.com>
 <20190611142259.GG29602@wheatley>
 <cda4d898-39c7-1d76-8dd3-e0067d2cbce8@redhat.com>
 <24d70886-d29a-9283-5ec9-f98308ce2ce9@redhat.com>
 <20190611175239.GS3888@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Content-Disposition: inline
In-Reply-To: <20190611175239.GS3888@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Wed, 12 Jun 2019 21:34:40 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <y7p2Na-bzXI.A.OoG.DAXAdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/581
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190612213433.GB19349@wheatley
Resent-Date: Wed, 12 Jun 2019 21:34:59 +0000 (UTC)


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2019 at 06:52:39PM +0100, Richard W.M. Jones wrote:
>ISTM to be overcomplicating things a bit.
>
>I will just note that SOAP (oh yes!) deals with this by having a
>=E2=80=98soap:mustunderstand=E2=80=99 XML attribute that you can add to he=
aders to say
>basically fail if you don't understand this bit.
>
>But it's still overcomplicating ...
>

Yes, that very well might be the case, hence my note about this possibly be=
ing
way too much.  I'm glad to have gotten the feedback from the discussion and=
 I
agree with it.  I just saw something that could bite us in the bottom and a
possible solution which would not be a huge burden.

Thanks for giving it a thought.

>Rich.
>
>--=20
>Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjo=
nes
>Read my programming and virtualization blog: http://rwmj.wordpress.com
>virt-df lists disk usage of guests without needing to install any
>software inside the virtual machine.  Supports Linux and Windows.
>http://people.redhat.com/~rjones/virt-df/

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiXAnXDYdKAaCyvS1CB/CnyQXht0FAl0Bb+kACgkQCB/CnyQX
ht3cCBAAiJygsBLHSy+txWU/A9P3G7rT5OvfVIssKvHfOInN04jDdFi4+YS/YzgB
al3SlBuDelV8cGCOv1EEN7Kqc2UBCZMM4ViUfqvLXpl7Xlfh3hYv1TMxLF1jqaYw
6hEWpcivEcZ2u4fccPLGQNJVTE823h+f63hzjiaxR9AcRwFRcT/eyf/gJ9hvE9Ag
/VNpybW4fFuAsE2i2S8Tj8oMYYhtWE53Eoxe0+3KMhfP3Gr6fcHbQnoEYF2gI2zY
p+Zl9tjZDVOxsG2E3sf7cha7k/myr1Ao6/3zMEBmOncPSF2n6Qn9ZE6FCFT1qTCj
zvLru+CHg7J55OMLy1RcQHNzxouZItAnJKrZVG9k2+xK/ynMyoaTz4HhpxQDAcYY
QPlyiyI/m8A0JZRy0RYLQEKvRQzMgRc4e8jytvO0KO0kTqEOA2lx0tJZfkuUncdK
/5w1Ntf1XbecDtRW8Y5tpQbWSBxsV0wbe3owOYDWTaAYR/FHQO9E88WLJlJCqACx
EZy6VyFeCzirKZPREWA4QTSYhK6upzK85A7agLp/GdAQMUH10wwMWpEBGXcB6XgW
9/TOayPA3UrvKU4ucRL+1Jzm/JBLexU7RFmvplE4BHLRbfqY4UvG9kW34pdr+1Bc
3+c81sUMbbM5sg+55cZkvHrMl/A2jK9lsPQBzhkbx4CdWOWTuj0=
=+cv5
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--

