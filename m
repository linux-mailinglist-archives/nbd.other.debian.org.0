Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 880D1453484
	for <lists+nbd@lfdr.de>; Tue, 16 Nov 2021 15:42:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3630820354; Tue, 16 Nov 2021 14:42:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 16 14:42:14 2021
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D82CC2030A
	for <lists-other-nbd@bendel.debian.org>; Tue, 16 Nov 2021 14:42:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.95 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LU2nGeX4vyQc for <lists-other-nbd@bendel.debian.org>;
	Tue, 16 Nov 2021 14:41:59 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 98BE8202D3
	for <nbd@other.debian.org>; Tue, 16 Nov 2021 14:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637073714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nh7pssHaxw/NI1Q/Xu1cgKwSMm79mCD6pKJmZSLRIxc=;
	b=SPrz/RDuMqy9F07PWAauymSasWrM/Re0/iC9dk4z0GonC/49i2wxxseaZPAFOD37sPV1y2
	dvAI5UyAx4Ph9nxdjbWTNTf/bonOdwS6JsVu73tp+a+AqkTaDQmBUeR2F1N8lXxH55lzv3
	5QTfFStFNe9JgAAn8ZbfvTIOiS+jvNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-qZPI1AS5PCmgz3OkNtoTiw-1; Tue, 16 Nov 2021 09:41:51 -0500
X-MC-Unique: qZPI1AS5PCmgz3OkNtoTiw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3C3210557CF;
	Tue, 16 Nov 2021 14:41:49 +0000 (UTC)
Received: from localhost (unknown [10.39.192.178])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97BBA19D9B;
	Tue, 16 Nov 2021 14:41:45 +0000 (UTC)
Date: Tue, 16 Nov 2021 14:41:44 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, asn@redhat.com
Subject: Re: NBD 3.23
Message-ID: <20211116144144.GA32364@redhat.com>
References: <YZODWCQS+9+JiVpi@pc181009.grep.be>
MIME-Version: 1.0
In-Reply-To: <YZODWCQS+9+JiVpi@pc181009.grep.be>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ASjAxZn6MeP.A.aT.GN8khB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1614
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211116144144.GA32364@redhat.com
Resent-Date: Tue, 16 Nov 2021 14:42:14 +0000 (UTC)

On Tue, Nov 16, 2021 at 12:09:28PM +0200, Wouter Verhelst wrote:
> Hi,
> 
> There was a small but crucial bug in NBD 3.22, which meant that the
> client would only connect to localhost (🤦). I've uploaded a new version
> of NBD to the usual spot to fix that issue.
> 
> If anyone can come up with a good way to test that nbd-client actually
> connects to a host that is *not* localhost which we can add to the test
> suite, that'd be nice :) otherwise, I'll try to remember to test this
> manually from now on.

If you don't mind another dependency (which I think is probably OK for
tests, but make it optional!) then cwrap can do this, specifically I
think you need nss_wrapper.

https://cwrap.org/
https://lwn.net/Articles/594863/

Fedora package:
https://src.fedoraproject.org/rpms/nss_wrapper

Debian package:
https://packages.debian.org/sid/libnss-wrapper

(This is assuming you are really testing name resolution, rather than
wanting to test that it can actually connect to a remote host, which
is not going to be easy without using VMs or something like that.)

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html

