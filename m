Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id F02946E66DB
	for <lists+nbd@lfdr.de>; Tue, 18 Apr 2023 16:13:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8881A20C77; Tue, 18 Apr 2023 14:13:41 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Apr 18 14:13:41 2023
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	LONGWORD,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E9EE420C75
	for <lists-other-nbd@bendel.debian.org>; Tue, 18 Apr 2023 14:13:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, LONGWORD=2, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jCPWhtj8_fKV for <lists-other-nbd@bendel.debian.org>;
	Tue, 18 Apr 2023 14:13:21 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id A266620C74
	for <nbd@other.debian.org>; Tue, 18 Apr 2023 14:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681827195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CskR2WDOyFo8MAsHuNOAXGogCFnseXgGNLqXH3N2now=;
	b=S7CupWYtKOEnNDhJDVvMcgf6KMNQ8vHItDElb7ruDywADXAwbkOkf6WBLKqltboK/DGn8W
	jOGcaapKY5uK11cqgA8ntEWqnVp/qsFXVQ9idK9HWXes1IRgRkWcmm5Vr7JK+NKNFFdYEN
	VQT0/EZvTC32BwplDv6yy1PJiiwIqb0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-LOJ0qf12NkeIM2JJAQp3ow-1; Tue, 18 Apr 2023 10:13:14 -0400
X-MC-Unique: LOJ0qf12NkeIM2JJAQp3ow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4100C1C189AF;
	Tue, 18 Apr 2023 14:13:12 +0000 (UTC)
Received: from localhost (unknown [10.39.195.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F170E2018620;
	Tue, 18 Apr 2023 14:13:11 +0000 (UTC)
Date: Tue, 18 Apr 2023 15:13:11 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: Eric Blake <eblake@redhat.com>, libguestfs@redhat.com,
	qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [Libguestfs] [PATCH v3 6/6] RFC: spec: Introduce
 NBD_REPLY_TYPE_OFFSET_HOLE_EXT
Message-ID: <20230418141311.GS7773@redhat.com>
References: <20230413220241.1396012-1-eblake@redhat.com>
 <20230413220241.1396012-7-eblake@redhat.com>
 <ZD6OJXoQBNJH5p4W@pc220518.home.grep.be>
MIME-Version: 1.0
In-Reply-To: <ZD6OJXoQBNJH5p4W@pc220518.home.grep.be>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <k32Bf_gNguG.A.Pz.VWqPkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2434
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230418141311.GS7773@redhat.com
Resent-Date: Tue, 18 Apr 2023 14:13:41 +0000 (UTC)

On Tue, Apr 18, 2023 at 02:33:41PM +0200, Wouter Verhelst wrote:
> On Thu, Apr 13, 2023 at 05:02:41PM -0500, Eric Blake wrote:
> > Rather than requiring all servers and clients to have a 32-bit limit
> > on maximum NBD_CMD_READ/WRITE sizes, we can choose to standardize
> > support for a 64-bit single I/O transaction now.
> > NBD_REPLY_TYPE_OFFSET_DATA can already handle a large reply, but
> > NBD_REPLY_TYPE_OFFSET_HOLE needs a 64-bit counterpart.
> > 
> > By standardizing this, all clients must be prepared to support both
> > types of hole type replies, even though most server implementations of
> > extended replies are likely to only send one hole type.
> 
> I think it's probably a better idea to push this patch to a separate
> "extension-*" branch, and link to that from proto.md on master. Those
> are documented as "we standardized this, but no first implementor exists
> yet".
> 
> If someone actually comes up with a reason for 64-bit transactions, we
> can then see if the spec matches the need and merge it to master.
> 
> Otherwise this feels too much like a solution in search of a problem to
> me.

I'd like to push back a bit on this.  Firstly Eric does have two
complete implementations.  It's true however that they not upstream in
either case.

But we also need this because there are relatively serious issues
observed, particularly around trimming/zeroing, and extents.  The
trimming problem can be demonstrated very easily in fact:

    $ nbdkit -U - --filter=stats memory 1P statsfile=/dev/stdout --run ' time guestfish add "" protocol:nbd server:unix:$unixsocket discard:enable format:raw : run : mkfs xfs /dev/sda '
    
    real	 4m17.531s
    user	 0m0.032s
    sys	 0m0.040s
    total: 1066328 ops, 257.558068 s, 1048578.04 GiB, 4071.23 GiB/s
    read: 4356 ops, 0.003335 s, 14.61 MiB, 4.28 GiB/s op, 58.08 KiB/s total
      Request size and alignment breakdown:
        12 bits: 50.8% (2215 reqs, 8.65 MiB total)
             12 bit aligned: 100.0% (2215)
             13 bit aligned:  51.6% (1143)
             14 bit aligned:  26.9% (595)
             15 bit aligned:  14.6% (323)
             16 bit aligned:   8.4% (185)
             17+ bit-aligned:  4.9% (109)
         9 bits: 47.4% (2064 reqs, 1.01 MiB total)
              9 bit aligned: 100.0% (2064)
             10+ bit-aligned:  0.6% (13)
        other sizes:  1.8% (77 reqs, 14.61 MiB total)
    
    write: 13325 ops, 0.046782 s, 31.29 MiB, 668.91 MiB/s op, 124.41 KiB/s total
      Request size and alignment breakdown:
        12 bits: 53.8% (7170 reqs, 28.01 MiB total)
             12 bit aligned: 100.0% (7170)
             13 bit aligned:  50.0% (3585)
             14 bit aligned:  25.0% (1793)
             15 bit aligned:  12.5% (896)
             16 bit aligned:   6.2% (448)
             17+ bit-aligned:  3.1% (224)
         9 bits: 46.2% (6150 reqs, 3.00 MiB total)
              9 bit aligned: 100.0% (6150)
             10 bit aligned:  33.4% (2054)
             12 bit aligned:  16.7% (1029)
             13 bit aligned:   8.4% (515)
             14+ bit-aligned:  4.2% (259)
        other sizes:  0.0% (5 reqs, 31.29 MiB total)
    
    trim: 1048576 ops, 306.059735 s, 1048576.00 GiB, 3426.05 GiB/s op, 4071.22 GiB/s total
      Request size and alignment breakdown:
        30 bits: 100.0% (1048576 reqs, 1048576.00 GiB total)
             30 bit aligned: 100.0% (1048576)
             31 bit aligned:  50.0% (524288)
             32 bit aligned:  25.0% (262144)
             33 bit aligned:  12.5% (131072)
             34 bit aligned:   6.2% (65536)
             35+ bit-aligned:  3.1% (32768)
    
    zero: 64 ops, 0.003912 s, 1.99 GiB, 508.75 GiB/s op, 7.91 MiB/s total
      Request size and alignment breakdown:
        25 bits: 98.4% (63 reqs, 1.97 GiB total)
             13 bit aligned: 100.0% (63)
        other sizes:  1.6% (1 reqs, 1.99 GiB total)
    
    flush: 7 ops, 0.000001 s, 0 bytes, 0 bytes/s op, 0 bytes/s total

Note how trim takes a million operations and most of the time.  That
should be done in one operation.  If you stop advertising discard
support on the disk ("discard:disable") it takes only a fraction of
the time.

The extents one is harder to demonstrate, but it makes our code
considerably more complex that we cannot just grab the extent map for
a whole disk larger than 4GB in a single command.  (The complexity
won't go away, but the querying will be faster with fewer round trips
with this change.)

Nevertheless I'm not opposed to keeping this as an extension until the
implementations are upstream and bedded in.

Rich.


> With that said, for the things I didn't reply to, you can add:
> 
> Reviewed-By: Wouter Verhelst <w@uter.be>
> 
> -- 
>      w@uter.{be,co.za}
> wouter@{grep.be,fosdem.org,debian.org}
> 
> I will have a Tin-Actinium-Potassium mixture, thanks.
> 
> _______________________________________________
> Libguestfs mailing list
> Libguestfs@redhat.com
> https://listman.redhat.com/mailman/listinfo/libguestfs

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v

