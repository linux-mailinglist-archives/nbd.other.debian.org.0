Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BFED7230A9
	for <lists+nbd@lfdr.de>; Mon, 20 May 2019 11:50:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8C8A1203BC; Mon, 20 May 2019 09:50:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 20 09:50:12 2019
Old-Return-Path: <mkletzan@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,PGPSIGNATURE,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 23639203B5
	for <lists-other-nbd@bendel.debian.org>; Mon, 20 May 2019 09:50:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-16.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, LDO_WHITELIST=-5,
	MD5_SHA1_SUM=-1, PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Qw0YBTAaGqgq for <lists-other-nbd@bendel.debian.org>;
	Mon, 20 May 2019 09:50:00 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5F83320299
	for <nbd@other.debian.org>; Mon, 20 May 2019 09:50:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C566230842A8;
	Mon, 20 May 2019 09:49:56 +0000 (UTC)
Received: from caroline (unknown [10.43.2.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E8CC5C57D;
	Mon, 20 May 2019 09:49:56 +0000 (UTC)
Received: by caroline (Postfix, from userid 1000)
	id 124F6121500; Mon, 20 May 2019 11:49:55 +0200 (CEST)
Date: Mon, 20 May 2019 11:49:55 +0200
From: Martin Kletzander <mkletzan@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org, berrange@redhat.com, eblake@redhat.com, w@uter.be
Subject: Re: Standard NBD URL syntax (again)
Message-ID: <20190520094955.GB8994@wheatley>
References: <20190520092056.GA9368@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
In-Reply-To: <20190520092056.GA9368@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 20 May 2019 09:49:56 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <NdDaQXKiqaN.A.HNG.Uhn4cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/500
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190520094955.GB8994@wheatley
Resent-Date: Mon, 20 May 2019 09:50:12 +0000 (UTC)


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2019 at 10:20:56AM +0100, Richard W.M. Jones wrote:
>
>Previous discussion:
>https://lists.debian.org/nbd/2018/07/msg00002.html
>
>Again I'm stuck because we need a URL syntax for NBD.
>
>Various URLs have been proposed before:
>
>  * Library      Hostname+port over TCP/IP
>                 Unix domain socket
>		 Export name
>  - Link for further information
>  - Notes
>
>  * libguestfs   nbd://example.com:port      (:port is optional)
>                 nbd://?socket=3D/socket
>		 nbd://example.com:port/exportname
>                 nbd:///exportname?socket=3D/socket
>  - http://libguestfs.org/guestfish.1.html#a-nbd:-example.com-:port
>  - Cannot specify an export name without a leading '/' character
>
>  * QEMU         nbd:example.com:port
>                 nbd:unix:/socket
>		 nbd:example.com:port:exportname=3D/export
>  - https://qemu.weilnetz.de/doc/qemu-doc.html#Device-URL-Syntax
>  - Not a real URL!
>

QEMU also accepts real URLs, even for unix sockets:

  nbd+unix:///?socket=3Dnbdkit.sock

I haven't yet checked how the exportname is handled, though.

>  * Curl         nbd://example.com/
>                 nbd://example.com/exportname
>  - https://github.com/rwmjones/curl/commit/2aba3dd7d8f9b8e03a8c3435e7555a=
b9e195675a#diff-77ab3188c0ad08b7b9d8d9787c8e9d75
>  - Cannot specify an export name without a leading '/' character
>  - No Unix domain socket syntax was ever defined.
>  - Did not go upstream.
>
>The leading problem with the "obvious" NBD URL format seems to be that
>it's impossible to specify empty export names or export names which
>don't start with a '/' character.
>
>This is why I'd be inclined to use an extra URL parameter instead,
>like:
>
>  nbd://example.com[:port]/?export=3Dexportname
>
>and for Unix domain sockets:
>
>  nbd:///?export=3Dexportname&socket=3D/socket
>
>The export would be optional, defaulting to empty string.  IPv6
>addresses would work in the obvious way for URLs, using "[...]"
>around the address part (ie as in RFC 2732).  All escaping issues
>would work as for standard URLs.
>
>I think we should standardize this once and for all in a document in
>the NBD repository.
>
>Anyway let me know what you think and I will try to write something
>formal.
>
>Rich.
>
>--=20
>Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjo=
nes
>Read my programming and virtualization blog: http://rwmj.wordpress.com
>virt-builder quickly builds VMs from scratch
>http://libguestfs.org/virt-builder.1.html
>

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiXAnXDYdKAaCyvS1CB/CnyQXht0FAlzieEIACgkQCB/CnyQX
ht0m7RAAsbluBwFT0s/6HEFCFpFXEMdXXR8tCCqnpfFITEEOKQZr7bzpGZNpPN18
aiSkc/Ob2vQo9MqQZnyN8zj1G/QYF8GfUdMQVPtS6ii5iOefBjjaxwprENEThgA2
MzETIi/7bKO6I0qilhTKMIcJsprlumZ27y4vzM/pj+gENQBNWFt/MqKKT/fXQXAv
daFYN2FP3NbXxZ8z3IMpibV/PrtcJybTd8vd3m1hQpREZqdwQI6DXZVH5GSvk0Js
ssgLzD7VH3gcte/zVgnfH6VP+3NKbdN9K6ThShKqKCAwbXLPNiZDTYHquWBtpUmB
fkcwzrDmhqaSy8d6aQjktmXLefrXu/LBb9Si5BIxe4iVuKpk5gGVVjeSoLBArBdd
9OtTV7GlzYoCS7yZk8tg3tBDJObGbXKorymJ9ehOkOV1YiZZmjNixRYnNTDrz5q1
GZsh9KDoKKURSldLfC2Ob9PEUOTa5k1uTLO45Ibqx+ioeqyDnyIZgtRKDwML19BI
lyCk2V6bGAmmlT3ywPNEz1VYmWkfJwsUT1Qss+HRqd6yjWZnp4ja0jsTOuI3IP1r
RRlrV7RGpKlfTgw7tpjJlkFV5SKVdRPOSEUQLRY5XQ3ALL4lAa7CI9IV7FvdL3ub
8fkKI3/E43caAs9sLris5o/FdmUFHl3x3wHiTkBUdFuAMypjFWw=
=kyql
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--

