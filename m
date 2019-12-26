Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 334F012AD20
	for <lists+nbd@lfdr.de>; Thu, 26 Dec 2019 15:59:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 016B82036E; Thu, 26 Dec 2019 14:59:27 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Dec 26 14:59:26 2019
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_MED autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F3F0220368
	for <lists-other-nbd@bendel.debian.org>; Thu, 26 Dec 2019 14:59:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.501 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id WOl6RCZfGwYb for <lists-other-nbd@bendel.debian.org>;
	Thu, 26 Dec 2019 14:59:15 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .us-smtp-delivery-1.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
X-Greylist: delayed 411 seconds by postgrey-1.36 at bendel; Thu, 26 Dec 2019 14:59:15 UTC
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by bendel.debian.org (Postfix) with ESMTP id 9996D20367
	for <nbd@other.debian.org>; Thu, 26 Dec 2019 14:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577372350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CepfQOY67bRs+IL15H5AHsf674PGeAXXHNwBs0VMKK4=;
	b=DC432McU5kwJBmq8xc/2I94tZj74lGOZovdkbW+vjkvudf9LnjdbujOzMnE5PwGwPiUDPJ
	WxIKzAr63/Dko6CG3HqHa2AQEHNLkcEXtDfFwbhKlB64hXhvhM7DN1n7KCUP1RK+jztJtk
	CvvM4/i9LFzYngolMbuYodvI/IU4Uck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-zAhSnASsORK6fQb3wdYojw-1; Thu, 26 Dec 2019 09:52:14 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DB6B18543A3;
	Thu, 26 Dec 2019 14:52:13 +0000 (UTC)
Received: from localhost (ovpn-117-237.ams2.redhat.com [10.36.117.237])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B67675C54A;
	Thu, 26 Dec 2019 14:52:12 +0000 (UTC)
Date: Thu, 26 Dec 2019 14:52:11 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Cc: qemu-block <qemu-block@nongnu.org>, nbd@other.debian.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Eric Blake <eblake@redhat.com>
Subject: Re: Selecting meta context when calling NBD_CMD_BLOCK_STATUS
Message-ID: <20191226145211.GA3888@redhat.com>
References: <CAMRbyyv23h0nCjh3b9oWAT_XGe+0=fDanbHOuAyK=QQJGPH5Yg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRbyyv23h0nCjh3b9oWAT_XGe+0=fDanbHOuAyK=QQJGPH5Yg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: zAhSnASsORK6fQb3wdYojw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <drgnIMYOngP.A.zpF.OrMBeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/759
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20191226145211.GA3888@redhat.com
Resent-Date: Thu, 26 Dec 2019 14:59:27 +0000 (UTC)

On Thu, Dec 26, 2019 at 04:29:03PM +0200, Nir Soffer wrote:
> Currently client need to use NBD_OPT_SET_META_CONTEXT during handshake to
> select the meta context it wants to get in NBD_CMD_BLOCK_STATUS.
>=20
> This means that if you want to provide the option to get both
> "base:allocation" and
> "qemu:dirty-bitmap:x" using the same NBD client connection, you must
> pay for getting
> both during NBD_CMD_BLOCK_STATUS even if the user of the NBD client is no=
t going
> to use both.
>=20
> Or, you can use new client connection for getting meta context not
> that the current
> client did not select, which require server that supports multiple
> connections, and new
> handshake. This seems to be more complicated than needed.

What's the problem with opening another connection?  Could it be
you're confusing this with the "multi-conn" capability which is
different?

Rich.

> This complicates existing clients:
> - qemu-img can return either "base:allocation" or
> "qemu:dirty-bitmap:x" using complex
>   undocumentde configuration
> - ovirt-imageio is using dirty flag in the client to enable both
> "base:allocation" and
>   "qemu:dirty-bitmap:x", so we can provide merged extents reporting
> both allocation
>   status and "dirtiness" for every extent.
>=20
> Should we extend NBD_CMD_BLOCK_STATUS so we can specify list of meta cont=
ext
> at the time of the call?
>=20
> Looking at command structure, I don't think it could be extended. We
> need to specify
> list of 32 bit context ids, so we need something like:
>=20
> 32 bits, length of payload (N * 4)
> 32 bits, contex id 1
> ...
> 32 bits, context id N
>=20
> But the length field of a BLOCK_STATUS command is already used to
> specify the range
> of the reply.
>=20
> So maybe add a new handshake flag, NBD_OPT_EXTENDED_COMMAND. If set durin=
g
> handshake, and NBD_FLAG_EXTENDED is set, a command will support
> additional payload
> like the list of context ids.
>=20
> So a BLOCK_STATUS command will look like:
>=20
> C: 32 bits, NBD_REQUEST_MAGIC)
> C: 16 bits, NBD_FLAG_EXTENDED
> C: 16 bits, NBD_CMD_BLOCK_STATUS
> C: 64 bits, 42
> C: 64 bits, 0
> C: 32 bits, 1073741824
> C: 32 bits: 4
> C: 32 bit: 1
>=20
> With this the server reply will be only for context id 1.
>=20
> What do you think?
>=20
> Nir

--=20
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjon=
es
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v

