Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D98161687
	for <lists+nbd@lfdr.de>; Mon, 17 Feb 2020 16:45:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1976C20500; Mon, 17 Feb 2020 15:45:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb 17 15:45:28 2020
Old-Return-Path: <mreitz@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,PGPSIGNATURE,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C2E4E2037E
	for <lists-other-nbd@bendel.debian.org>; Mon, 17 Feb 2020 15:45:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.101 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	PGPSIGNATURE=-5, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PZmjPbbigTUV for <lists-other-nbd@bendel.debian.org>;
	Mon, 17 Feb 2020 15:45:16 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.7
X-Greylist: delayed 1480 seconds by postgrey-1.36 at bendel; Mon, 17 Feb 2020 15:45:16 UTC
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by bendel.debian.org (Postfix) with ESMTP id 79DA32034A
	for <nbd@other.debian.org>; Mon, 17 Feb 2020 15:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581954310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vMdNbbtXE3oVzLFRsOYRGu+L4uNGscr82lhc4L9ZbtU=;
	b=gU3YXK02CGCx5/pBBJDFByRAErH6RKciC0UKobdlulynUt48C1/t5c4lnR0DqY8cR063PT
	M7jZbIWWSEWwG8F+9LdGT67TVIgBjvI+tHLbMyr10J7mHUBrg45thfUOKhZi4avPyuknxq
	Bdbzo1/ialhoQkWEjfySr9rQ+NpPyjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-1kPoWHK0MmiTHtVo3WVgGQ-1; Mon, 17 Feb 2020 10:14:04 -0500
X-MC-Unique: 1kPoWHK0MmiTHtVo3WVgGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22B6780574F;
	Mon, 17 Feb 2020 15:14:02 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-191.ams2.redhat.com [10.36.117.191])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53CD791820;
	Mon, 17 Feb 2020 15:13:56 +0000 (UTC)
Subject: Re: Cross-project NBD extension proposal: NBD_INFO_INIT_STATE
To: Eric Blake <eblake@redhat.com>,
 "nbd@other.debian.org" <nbd@other.debian.org>, QEMU <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "libguestfs@redhat.com" <libguestfs@redhat.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>
References: <a4394fde-f459-dcb5-1698-013e1e24c388@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Autocrypt: addr=mreitz@redhat.com; prefer-encrypt=mutual; keydata=
 mQENBFXOJlcBCADEyyhOTsoa/2ujoTRAJj4MKA21dkxxELVj3cuILpLTmtachWj7QW+TVG8U
 /PsMCFbpwsQR7oEy8eHHZwuGQsNpEtNC2G/L8Yka0BIBzv7dEgrPzIu+W3anZXQW4702+uES
 U29G8TP/NGfXRRHGlbBIH9KNUnOSUD2vRtpOLXkWsV5CN6vQFYgQfFvmp5ZpPeUe6xNplu8V
 mcTw8OSEDW/ZnxJc8TekCKZSpdzYoxfzjm7xGmZqB18VFwgJZlIibt1HE0EB4w5GsD7x5ekh
 awIe3RwoZgZDLQMdOitJ1tUc8aqaxvgA4tz6J6st8D8pS//m1gAoYJWGwwIVj1DjTYLtABEB
 AAG0HU1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+iQFTBBMBCAA9AhsDBQkSzAMABQsJ
 CAcCBhUICQoLAgQWAgMBAh4BAheABQJVzie5FRhoa3A6Ly9rZXlzLmdudXBnLm5ldAAKCRD0
 B9sAYdXPQDcIB/9uNkbYEex1rHKz3mr12uxYMwLOOFY9fstP5aoVJQ1nWQVB6m2cfKGdcRe1
 2/nFaHSNAzT0NnKz2MjhZVmcrpyd2Gp2QyISCfb1FbT82GMtXFj1wiHmPb3CixYmWGQUUh+I
 AvUqsevLA+WihgBUyaJq/vuDVM1/K9Un+w+Tz5vpeMidlIsTYhcsMhn0L9wlCjoucljvbDy/
 8C9L2DUdgi3XTa0ORKeflUhdL4gucWoAMrKX2nmPjBMKLgU7WLBc8AtV+84b9OWFML6NEyo4
 4cP7cM/07VlJK53pqNg5cHtnWwjHcbpGkQvx6RUx6F1My3y52vM24rNUA3+ligVEgPYBuQEN
 BFXOJlcBCADAmcVUNTWT6yLWQHvxZ0o47KCP8OcLqD+67T0RCe6d0LP8GsWtrJdeDIQk+T+F
 xO7DolQPS6iQ6Ak2/lJaPX8L0BkEAiMuLCKFU6Bn3lFOkrQeKp3u05wCSV1iKnhg0UPji9V2
 W5eNfy8F4ZQHpeGUGy+liGXlxqkeRVhLyevUqfU0WgNqAJpfhHSGpBgihUupmyUg7lfUPeRM
 DzAN1pIqoFuxnN+BRHdAecpsLcbR8sQddXmDg9BpSKozO/JyBmaS1RlquI8HERQoe6EynJhd
 64aICHDfj61rp+/0jTIcevxIIAzW70IadoS/y3DVIkuhncgDBvGbF3aBtjrJVP+5ABEBAAGJ
 ASUEGAEIAA8FAlXOJlcCGwwFCRLMAwAACgkQ9AfbAGHVz0CbFwf9F/PXxQR9i4N0iipISYjU
 sxVdjJOM2TMut+ZZcQ6NSMvhZ0ogQxJ+iEQ5OjnIputKvPVd5U7WRh+4lF1lB/NQGrGZQ1ic
 alkj6ocscQyFwfib+xIe9w8TG1CVGkII7+TbS5pXHRxZH1niaRpoi/hYtgzkuOPp35jJyqT/
 /ELbqQTDAWcqtJhzxKLE/ugcOMK520dJDeb6x2xVES+S5LXby0D4juZlvUj+1fwZu+7Io5+B
 bkhSVPb/QdOVTpnz7zWNyNw+OONo1aBUKkhq2UIByYXgORPFnbfMY7QWHcjpBVw9MgC4tGeF
 R4bv+1nAMMxKmb5VvQCExr0eFhJUAHAhVg==
Message-ID: <1b3741aa-7841-9062-ecca-73c38e599e05@redhat.com>
Date: Mon, 17 Feb 2020 16:13:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a4394fde-f459-dcb5-1698-013e1e24c388@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Nw6AAH3yTxeyeEPSZPCY4IYS8smMdco6V"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6cg_Zuw6g_F.A.b4H.YUrSeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/826
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1b3741aa-7841-9062-ecca-73c38e599e05@redhat.com
Resent-Date: Mon, 17 Feb 2020 15:45:28 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Nw6AAH3yTxeyeEPSZPCY4IYS8smMdco6V
Content-Type: multipart/mixed; boundary="CYE5T6HtN6kyKlRLeKj6C2PmyxrytuVwE"

--CYE5T6HtN6kyKlRLeKj6C2PmyxrytuVwE
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

It=E2=80=99s my understanding that without some is_zero infrastructure for =
QEMU,
it=E2=80=99s impossible to implement this flag in qemu=E2=80=99s NBD server=
.

At the same time, I still haven=E2=80=99t understood what we need the flag =
for.

As far as I understood in our discussion on your qemu series, there is
no case where anyone would need to know whether an image is zero.  All
practical cases involve someone having to ensure that some image is
zero.  Knowing whether an image is zero can help with that, but that can
be an implementation detail.

For qcow2, the idea would be that there is some flag that remains true
as long as the image is guaranteed to be zero.  Then we=E2=80=99d have some
bdrv_make_zero function, and qcow2=E2=80=99s implementation would use this
information to gauge whether there=E2=80=99s something to do as all.

For NBD, we cannot use this idea directly because to implement such a
flag (as you=E2=80=99re describing in this mail), we=E2=80=99d need separat=
e is_zero
infrastructure, and that kind of makes the point of =E2=80=9Cdrivers=E2=80=
=99
bdrv_make_zero() implementations do the right thing by themselves=E2=80=9D =
moot.

OTOH, we wouldn=E2=80=99t need such a flag for the implementation, because =
we
could just send a 64-bit discard/make_zero over the whole block device
length to the NBD server, and then the server internally does the right
thing(TM).  AFAIU discard and write_zeroes currently have only 32 bit
length fields, but there were plans for adding support for 64 bit
versions anyway.  From my na=C3=AFve outsider perspective, doing that doesn=
=E2=80=99t
seem a more complicated protocol addition than adding some way to tell
whether an NBD export is zero.

So I=E2=80=99m still wondering whether there are actually cases where we ne=
ed to
tell whether some image or NBD export is zero that do not involve making
it zero if it isn=E2=80=99t.

(I keep asking because it seems to me that if all we ever really want to
do is to ensure that some images/exports are zero, we should implement
that.)

Max


--CYE5T6HtN6kyKlRLeKj6C2PmyxrytuVwE--

--Nw6AAH3yTxeyeEPSZPCY4IYS8smMdco6V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl5KrbMACgkQ9AfbAGHV
z0BcbQgAnIPE1qdmhJ4KWwVx9x37GAooI293fHxyD79NgfNJlRQ5aUNmHdJlhJPM
BFJ2+S76Ecp6UDBwvPxnd6wt3sARuB3TrVbrfIU2A44uswTLTVm/+GvSeomAVDNL
RU7dJAelk4B9CRZ19dAB+Wm6jtfmb6eHLLuqdgQkxbuzVQDpIKIFLWUh1C1EEAUF
I0ir0DxDP0spyMUZ5AArysYt0vVUSzC2zNaw4/8GxcfQsq/41HaZp9+NR+BvRzC3
wos4av6y4BqS8eD45Z7ZqqCNLPvOPfBSv2BP00zrx4RZgIaZC1yaQFRmDvFz5zqq
rLNZxDhCdEtBzjZaEcamlQMKnMJToQ==
=9eXi
-----END PGP SIGNATURE-----

--Nw6AAH3yTxeyeEPSZPCY4IYS8smMdco6V--

