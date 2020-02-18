Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E29C016338F
	for <lists+nbd@lfdr.de>; Tue, 18 Feb 2020 21:55:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id ACF3A2037F; Tue, 18 Feb 2020 20:55:52 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb 18 20:55:52 2020
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2F42120378
	for <lists-other-nbd@bendel.debian.org>; Tue, 18 Feb 2020 20:55:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.101 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PnSoZi4Lqw7g for <lists-other-nbd@bendel.debian.org>;
	Tue, 18 Feb 2020 20:55:40 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by bendel.debian.org (Postfix) with ESMTP id 8B4C420379
	for <nbd@other.debian.org>; Tue, 18 Feb 2020 20:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582059335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Q+ZYE+cxtUvibcqJjja8mk3mm7opy0G92bmyXUjpxY=;
	b=LlBEBAs/td6ZZonW5U4X5qvNczWpbbuaqofXX8t8qQkIp77FTFOHDzXvJSy0Q/YsNjZVQw
	moSCh/x0B4Rgy+eztK+r2gs07KnU47TvcG36rrOCziYJ61GuiQS8IWFaW2Ygi8ye9sH6Yt
	WGwfdW+IQggezDaPymZG5t5IgklC954=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-gUKhjVMVNR6N8UsgMQlcTQ-1; Tue, 18 Feb 2020 15:55:26 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE14FDB20;
	Tue, 18 Feb 2020 20:55:23 +0000 (UTC)
Received: from [10.3.116.180] (ovpn-116-180.phx2.redhat.com [10.3.116.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 896A960BF7;
	Tue, 18 Feb 2020 20:55:19 +0000 (UTC)
Subject: Re: Cross-project NBD extension proposal: NBD_INFO_INIT_STATE
To: Max Reitz <mreitz@redhat.com>, "nbd@other.debian.org"
 <nbd@other.debian.org>, QEMU <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "libguestfs@redhat.com" <libguestfs@redhat.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>
References: <a4394fde-f459-dcb5-1698-013e1e24c388@redhat.com>
 <1b3741aa-7841-9062-ecca-73c38e599e05@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c47d277e-35f8-9837-1f1d-eab4bb6d5840@redhat.com>
Date: Tue, 18 Feb 2020 14:55:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1b3741aa-7841-9062-ecca-73c38e599e05@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: gUKhjVMVNR6N8UsgMQlcTQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9hasoO_dc5D.A.htG.Y9ETeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/827
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/c47d277e-35f8-9837-1f1d-eab4bb6d5840@redhat.com
Resent-Date: Tue, 18 Feb 2020 20:55:52 +0000 (UTC)

On 2/17/20 9:13 AM, Max Reitz wrote:
> Hi,
>=20
> It=E2=80=99s my understanding that without some is_zero infrastructure fo=
r QEMU,
> it=E2=80=99s impossible to implement this flag in qemu=E2=80=99s NBD serv=
er.

You're right that we may need some more infrastructure before being able=20
to decide when to report this bit in all cases.  But for raw files, that=20
infrastructure already exists: does block_status at offset 0 and the=20
entire image as length return status that the entire file is a hole.=20
And for qcow2 files, it would not be that hard to teach a similar=20
block_status request to report the entire image as a hole based on my=20
proposed qcow2 autoclear bit tracking that the image still reads as zero.

>=20
> At the same time, I still haven=E2=80=99t understood what we need the fla=
g for.
>=20
> As far as I understood in our discussion on your qemu series, there is
> no case where anyone would need to know whether an image is zero.  All > =
practical cases involve someone having to ensure that some image is
> zero.  Knowing whether an image is zero can help with that, but that can
> be an implementation detail.
>=20
> For qcow2, the idea would be that there is some flag that remains true
> as long as the image is guaranteed to be zero.  Then we=E2=80=99d have so=
me
> bdrv_make_zero function, and qcow2=E2=80=99s implementation would use thi=
s
> information to gauge whether there=E2=80=99s something to do as all.
>=20
> For NBD, we cannot use this idea directly because to implement such a
> flag (as you=E2=80=99re describing in this mail), we=E2=80=99d need separ=
ate is_zero
> infrastructure, and that kind of makes the point of =E2=80=9Cdrivers=E2=
=80=99
> bdrv_make_zero() implementations do the right thing by themselves=E2=80=
=9D moot.

We don't necessarily need a separate is_zero infrastructure if we can=20
instead teach the existing block_status infrastructure to report that=20
the entire image reads as zero.  You're right that clients that need to=20
force an entire image to be zero won't need to directly call=20
block_status (they can just call bdrv_make_zero, and let that worry=20
about whether a block status call makes sense among its list of steps to=20
try).  But since block_status can report all-zero status for some cases,=20
it's not hard to use that for feeding the NBD bit.

However, there's a difference between qemu's block status (which is=20
already typed correctly to return a 64-bit answer, even if it may need a=20
few tweaks for clients that currently don't expect it to request more=20
than 32 bits) and NBD's block status (which can only report 32 bits=20
barring a new extension to the protocol), and where a single all-zero=20
bit at NBD_OPT_GO is just as easy of an extension as a way to report a=20
64-bit all-zero response to NBD_CMD_BLOCK_STATUS.

>=20
> OTOH, we wouldn=E2=80=99t need such a flag for the implementation, becaus=
e we
> could just send a 64-bit discard/make_zero over the whole block device
> length to the NBD server, and then the server internally does the right
> thing(TM).  AFAIU discard and write_zeroes currently have only 32 bit
> length fields, but there were plans for adding support for 64 bit
> versions anyway.  From my na=C3=AFve outsider perspective, doing that doe=
sn=E2=80=99t
> seem a more complicated protocol addition than adding some way to tell
> whether an NBD export is zero.

Adding 64-bit commands to NBD is more invasive than adding a single=20
startup status bit.  Both ideas can be done - doing one does not=20
preclude the other.  But at the same time, not all servers will=20
implement both ideas - if one is easy to implement while the other is=20
hard, it is not unlikely that qemu will still encounter NBD servers that=20
advertise startup state but not support 64-bit make_zero (even if qemu=20
as NBD server starts supporting 64-bit make zero) or even 64-bit block=20
status results.

Another thing to think about here is timing.  With the proposed NBD=20
addition, it is the server telling the client that "the image you are=20
connecting to started zero", prior to the point that the client even has=20
a chance to request "can you make the image all zero in a quick manner=20
(and if not, I'll fall back to writing zeroes as I go)".  And even if=20
NBD gains a 64-bit block status and/or make zero command, it is still=20
less network traffic for the server to advertise up-front that the image=20
is all zero than it is for the client to have to issue command requests=20
of the server (network traffic is not always the bottleneck, but it can=20
be a consideration).

>=20
> So I=E2=80=99m still wondering whether there are actually cases where we =
need to
> tell whether some image or NBD export is zero that do not involve making
> it zero if it isn=E2=80=99t.

Just because we don't think that qemu-img has such a case does not mean=20
that other NBD clients will not be able to come up with some use for=20
knowing if an image starts all zero.

>=20
> (I keep asking because it seems to me that if all we ever really want to
> do is to ensure that some images/exports are zero, we should implement
> that.)

The problem is WHERE do you implement it.  Is it more efficient to=20
implement make_zero in the NBD server (the client merely requests to=20
make zero, but lets the server do all the work) or in the NBD client=20
(the client learns whether the server is already zero, and not hearing=20
yes, the client proceeds to do all the work to write zeroes).  From the=20
qemu perspective, qemu-img convert needs the image to be zero, and=20
bdrv_make_zero will report back either "yes I quickly made it zero,=20
possibly by doing nothing" or "no, making it zero now is no more=20
efficient than you just writing zeroes as you go".  But although the=20
code in qemu-img is the same whether bdrv_make_zero is able to request=20
the work be done in the server or whether the work has to be done in the=20
client, the code in the block layer that implements bdrv_make_zero may=20
itself care about knowing whether the NBD server started all zero.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

