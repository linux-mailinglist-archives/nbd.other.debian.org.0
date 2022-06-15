Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7549A54C582
	for <lists+nbd@lfdr.de>; Wed, 15 Jun 2022 12:09:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5AAF120539; Wed, 15 Jun 2022 10:09:54 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun 15 10:09:54 2022
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 28A9C20530
	for <lists-other-nbd@bendel.debian.org>; Wed, 15 Jun 2022 10:09:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.257 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.147, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Shvfi0THRFbi for <lists-other-nbd@bendel.debian.org>;
	Wed, 15 Jun 2022 10:09:39 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 3E08520527
	for <nbd@other.debian.org>; Wed, 15 Jun 2022 10:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655287774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j3/WF1UUQLdH3o//CdInkJSLN3Ev7z+W/6hF/qsvDbk=;
	b=S7JY6MKbx68LTrCljKdKEOTrDrFy60DYmQ3ScT2GSTBP91Z4NCYMQyJem89Jz8nmUxo6hG
	EzQ34agR6Smku4ymDywJ5Twx9T3Je20JzfwJuOOZDhjJJQvTPbk5B7jCtHenQr6ZhlNec5
	DNTAP2tKnEJYC+l3/bz7c1UtLdjMDkM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-s5GWRsceO5S9sKZY06eHhQ-1; Wed, 15 Jun 2022 06:09:32 -0400
X-MC-Unique: s5GWRsceO5S9sKZY06eHhQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97FA329AB3EB
	for <nbd@other.debian.org>; Wed, 15 Jun 2022 10:09:32 +0000 (UTC)
Received: from localhost (unknown [10.39.192.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 55D21492CA5;
	Wed, 15 Jun 2022 10:09:32 +0000 (UTC)
Date: Wed, 15 Jun 2022 11:09:31 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>, nbd@other.debian.org,
	libguestfs@redhat.com
Subject: Re: Kernel driver I/O block size hinting
Message-ID: <20220615100931.GS1127@redhat.com>
References: <20220614143819.GX8021@redhat.com>
 <87bkuv59h4.fsf@vostro.rath.org>
MIME-Version: 1.0
In-Reply-To: <87bkuv59h4.fsf@vostro.rath.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-ivwOQVG1SJ.A.WkC.y_aqiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2139
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220615100931.GS1127@redhat.com
Resent-Date: Wed, 15 Jun 2022 10:09:54 +0000 (UTC)

On Tue, Jun 14, 2022 at 08:30:15PM +0100, Nikolaus Rath wrote:
> On Jun 14 2022, "Richard W.M. Jones" <rjones@redhat.com> wrote:
> > I think we should set logical_block_size == physical_block_size ==
> > MAX (512, NBD minimum block size constraint).
> 
> Why the lower bound of 512?

I suspect the kernel can't handle sector sizes smaller than 512 bytes.
By default the NBD protocol advises advertising a minimum size of 1
byte, and I'm almost certain setting logical_block_size == 1 would
break everything.

> > What should happen to the nbd-client -b option?
> 
> Perhaps it should become the lower-bound (instead of the hardcoded 512)?
> That's assuming there is a reason for having a client-specified lower
> bound.

Right, I don't think there's a reason to continue with the -b option.
I only use it to set -b 512 to work around the annoying default in
older versions (which was 1024).

> > (4) Kernel blk_queue_max_hw_sectors: This is documented as: "set max
> > sectors for a request ... Enables a low level driver to set a hard
> > upper limit, max_hw_sectors, on the size of requests."
> >
> > Current behaviour of nbd.ko is that we set this to 65536 (sectors?
> > blocks?), which for 512b sectors is 32M.
> 
> FWIW, on my 5.16 kernel, the default is 65 kB (according to
> /sys/block/nbdX/queue/max_sectors_kb x 512b).

I have:

$ cat /sys/devices/virtual/block/nbd0/queue/max_hw_sectors_kb 
32768

(ie. 32 MB) which I think comes from the nbd module setting:

        blk_queue_max_hw_sectors(disk->queue, 65536);

multiplied by 512b sectors.

> > I think we could set this to MIN (32M, NBD maximum block size constraint),
> > converting the result to sectors.
> 
> I don't think that's right. Rather, it should be NBD's preferred block
> size.
>
> Setting this to the preferred block size means that NBD requests will be
> this large whenever there are enough sequential dirty pages, and that no
> requests will ever be larger than this. I think this is exactly what the
> NBD server would like to have.

This kernel setting limits the maximum request size on the queue.

In my testing reading and writing files with the default [above] the
kernel never got anywhere near sending multi-megabyte requests.  In
fact the largest request it sent was 128K, even when I did stuff like:

# dd if=/dev/zero of=/tmp/mnt/zero bs=100M count=10

128K happens to be 2 x blk_queue_io_opt, but I need to do more testing
to see if that relationship always holds.

> Settings this to the maximum block size would mean that NBD requests
> will exceed the preferred size whenever there are enough sequential
> dirty pages (while still obeying the maximum). This seems strictly
> worse.
> 
> Unrelated to the proposed changes (all of which I think are technically
> correct), I am wondering if this will have much practical benefits. As
> far as I can tell, the kernel currently aligns NBD requests to the
> logical/physical block size rather than the size of the NBD request. Are
> there NBD servers that would benefit from the kernel honoring the
> preferred blocksize if the data is not also aligned to this blocksize? 

I'm not sure I parsed this.  Can you give an example?

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
nbdkit - Flexible, fast NBD server with plugins
https://gitlab.com/nbdkit/nbdkit

