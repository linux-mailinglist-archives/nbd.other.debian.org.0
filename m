Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id BD047FFAD3
	for <lists+nbd@lfdr.de>; Sun, 17 Nov 2019 18:05:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9C77920DAF; Sun, 17 Nov 2019 17:05:40 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Nov 17 17:05:40 2019
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,RCVD_IN_DNSWL_MED
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0F82A20D3D
	for <lists-other-nbd@bendel.debian.org>; Sun, 17 Nov 2019 17:05:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.4 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id cADpdntjgltb for <lists-other-nbd@bendel.debian.org>;
	Sun, 17 Nov 2019 17:05:28 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 310 seconds by postgrey-1.36 at bendel; Sun, 17 Nov 2019 17:05:28 UTC
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by bendel.debian.org (Postfix) with ESMTP id 28BFD20D64
	for <nbd@other.debian.org>; Sun, 17 Nov 2019 17:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574010323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E72ZrVSS3vygVMm8IAKL6pChQMj9BcYC7SJtaQNwxSg=;
	b=F1LnIRm0paTwpLJOFF/XCAkpLCE1D4LNCJpb/PappxRaQ0msuDOUaBj/0VOZffppGBly5Q
	LMM4hX8qER6rtclk8MlHm33kW8dqXLXZgHcmuC9Ua6KW9+6Mb6eee56YCsFo48d9cm6vBM
	DJJ6LNCID2QE1MNiO+VUGE/fceKiayc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-gTR7JPoyN3G6kH5bUY96Yw-1; Sun, 17 Nov 2019 11:59:00 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24BFD1005500;
	Sun, 17 Nov 2019 16:58:58 +0000 (UTC)
Received: from localhost (ovpn-116-66.ams2.redhat.com [10.36.116.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E755100EBBB;
	Sun, 17 Nov 2019 16:58:56 +0000 (UTC)
Date: Sun, 17 Nov 2019 16:58:55 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: kernel list <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@osdl.org>, Wouter Verhelst <w@uter.be>,
	nbd@other.debian.org
Subject: Re: nbd, nbdkit, loopback mounts and memory management
Message-ID: <20191117165855.GD16477@redhat.com>
References: <20190215191953.GB17897@amd>
 <20190215224126.GX12500@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190215224126.GX12500@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: gTR7JPoyN3G6kH5bUY96Yw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <uq4gxV1_FvL.A.qnF.k3X0dB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/736
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20191117165855.GD16477@redhat.com
Resent-Date: Sun, 17 Nov 2019 17:05:40 +0000 (UTC)


FWIW to follow up to this old thread, I made the change in nbdkit:

https://github.com/libguestfs/nbdkit/commit/acc37af9989aae708e8acad3535e149=
1931e6bdb

Rich.

--=20
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjon=
es
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html

