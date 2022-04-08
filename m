Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE4A4F97A8
	for <lists+nbd@lfdr.de>; Fri,  8 Apr 2022 16:07:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 760DB204D7; Fri,  8 Apr 2022 14:07:58 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Apr  8 14:07:58 2022
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 33A7120414
	for <lists-other-nbd@bendel.debian.org>; Fri,  8 Apr 2022 14:07:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.889 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id SEb7QBQRFL-i for <lists-other-nbd@bendel.debian.org>;
	Fri,  8 Apr 2022 14:07:44 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 377 seconds by postgrey-1.36 at bendel; Fri, 08 Apr 2022 14:07:44 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 79C20203EB
	for <nbd@other.debian.org>; Fri,  8 Apr 2022 14:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649426859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a8HuvUOAANWVJKXcpG8lHDSO/ntiTMreUdWH1eM2Szc=;
	b=i4J9xyFvnj4JLKSXzXANgw5XyWJyr7HOpqlvwxaYnnanU9gNzknIKACBN7+McgorKXLDNu
	4eaMVs/Gwb+2+fcnvF3CDojIdYm0dP3tN3Ut8/veo44MOAX25Hd/jY4ollhTYn4l7Z3hBC
	UzYfzVMkWQ1zhCgEY90rS9Mkhvtv3w0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-ZNUB0hX1MvilvTMaRlC1Aw-1; Fri, 08 Apr 2022 10:01:19 -0400
X-MC-Unique: ZNUB0hX1MvilvTMaRlC1Aw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C75B9185A79C;
	Fri,  8 Apr 2022 14:01:18 +0000 (UTC)
Received: from localhost (unknown [10.39.192.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 84DF52024CC6;
	Fri,  8 Apr 2022 14:01:18 +0000 (UTC)
Date: Fri, 8 Apr 2022 15:01:17 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Cc: Wouter Verhelst <w@uter.be>, v.sementsov-og@mail.ru,
	Eric Blake <eblake@redhat.com>, libguestfs@redhat.com,
	qemu-block <qemu-block@nongnu.org>, nbd@other.debian.org
Subject: Re: [Libguestfs] [PATCH 1/2] spec: Recommend cap on
 NBD_REPLY_TYPE_BLOCK_STATUS length
Message-ID: <20220408140117.GY1127@redhat.com>
References: <20220407213720.250252-1-eblake@redhat.com>
 <20220407213720.250252-2-eblake@redhat.com>
 <Yk/jTZcHpW5qWsvg@pc181009.grep.be>
 <20220408115244.GL8021@redhat.com>
 <CAMRbyysweeBoZLm+uNKZZ7QRkHfNNwm4FyGmq+9V7ApLfpQSvQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRbyysweeBoZLm+uNKZZ7QRkHfNNwm4FyGmq+9V7ApLfpQSvQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <htu4vXErccF.A.TDD.-GEUiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1928
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220408140117.GY1127@redhat.com
Resent-Date: Fri,  8 Apr 2022 14:07:58 +0000 (UTC)

On Fri, Apr 08, 2022 at 04:48:59PM +0300, Nir Soffer wrote:
> This is a malicious server. A good client will drop the connection when
> receiving the first 1 byte chunk.
> 
> The real issue here is not enforcing or suggesting a limit on the number of
> extent the server returns, but enforcing a limit on the minimum size of
> a chunk.
> 
> Since this is the network *block device* protocol it should not allow chunks
> smaller than the device block size, so anything smaller than 512 bytes
> should be invalid response from the server.
> 
> Even the last chunk should not be smaller than 512 bytes. The fact that you
> can serve a file with size that is not aligned to 512 bytes does not mean that
> the export size can be unaligned to the logical block size. There are no real
> block devices that have such alignment so the protocol should not allow this.
> A good server will round the file size down the logical block size to avoid this
> issue.
> 
> How about letting the client set a minimum size of a chunk? This way we
> avoid the issue of limiting the number of chunks. Merging small chunks
> is best done on the server side instead of wasting bandwidth and doing
> this on the client side.

While it's interesting to know if chunks should obey the
(server-specified) minimum block size, I don't think we should force
operations to only work on sector boundaries.  That's a step
backwards.  We've spent a long time and effort making nbdkit & NBD
work well for < 512 byte images, byte granularity tails, and disk
operations.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

