Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0804538B0
	for <lists+nbd@lfdr.de>; Tue, 16 Nov 2021 18:42:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BEBE42027A; Tue, 16 Nov 2021 17:42:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 16 17:42:09 2021
Old-Return-Path: <asn@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 51DFB20267
	for <lists-other-nbd@bendel.debian.org>; Tue, 16 Nov 2021 17:25:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.95 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vAMVditGgrB6 for <lists-other-nbd@bendel.debian.org>;
	Tue, 16 Nov 2021 17:25:24 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id EB6742025E
	for <nbd@other.debian.org>; Tue, 16 Nov 2021 17:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637083518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FWQnB3eBasNL4jzS5i9+mlUwZ7uOMn5Wjxmy1VsOi4g=;
	b=abKYBzhc32v02sc1imkyn4aADyeU3QDNPb/KMiHKWtI7G4ij1zi2gUre2mFjOW5FGw+JGf
	gp4PibHm3Wt3vUqbffaLBnVY0vbEYvNALFxK+7a/WEI0oQhXzlThZcRryB1KRP5jRoJql9
	TmZDPjqt2dRknJif6nHBdXRnskkJySg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-91glBgDHPy2TzE7-kC8Bug-1; Tue, 16 Nov 2021 11:53:47 -0500
X-MC-Unique: 91glBgDHPy2TzE7-kC8Bug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5581D804140;
	Tue, 16 Nov 2021 16:53:46 +0000 (UTC)
Received: from magrathea.localnet (unknown [10.39.208.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 66D7219D9B;
	Tue, 16 Nov 2021 16:53:44 +0000 (UTC)
From: Andreas Schneider <asn@redhat.com>
To: Wouter Verhelst <w@uter.be>, "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org
Subject: Re: NBD 3.23
Date: Tue, 16 Nov 2021 17:53:43 +0100
Message-ID: <3164824.5WEQUB1sqc@magrathea>
In-Reply-To: <20211116144144.GA32364@redhat.com>
References: <YZODWCQS+9+JiVpi@pc181009.grep.be> <20211116144144.GA32364@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=asn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <f-Jw8riDJzE.A.M6.x1-khB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1615
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/3164824.5WEQUB1sqc@magrathea
Resent-Date: Tue, 16 Nov 2021 17:42:09 +0000 (UTC)

On Tuesday, November 16, 2021 3:41:44 PM CET Richard W.M. Jones wrote:
> On Tue, Nov 16, 2021 at 12:09:28PM +0200, Wouter Verhelst wrote:
> > Hi,
> >=20
> > There was a small but crucial bug in NBD 3.22, which meant that the
> > client would only connect to localhost (=F0=9F=A4=A6). I've uploaded a =
new version
> > of NBD to the usual spot to fix that issue.
> >=20
> > If anyone can come up with a good way to test that nbd-client actually
> > connects to a host that is *not* localhost which we can add to the test
> > suite, that'd be nice :) otherwise, I'll try to remember to test this
> > manually from now on.
>=20
> If you don't mind another dependency (which I think is probably OK for
> tests, but make it optional!) then cwrap can do this, specifically I
> think you need nss_wrapper.
>=20
> https://cwrap.org/
> https://lwn.net/Articles/594863/
>=20
> Fedora package:
> https://src.fedoraproject.org/rpms/nss_wrapper
>=20
> Debian package:
> https://packages.debian.org/sid/libnss-wrapper

I think you want socket_wrapper and nss_wrapper. socket_wrapper is the tool=
 to=20
create the network, nss_wrapper for name resolution :-)

Best regards


=09Andreas


