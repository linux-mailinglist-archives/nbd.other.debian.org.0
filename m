Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE8C4F948B
	for <lists+nbd@lfdr.de>; Fri,  8 Apr 2022 13:53:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A9BEC2044E; Fri,  8 Apr 2022 11:53:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Apr  8 11:53:08 2022
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=4.0 tests=DIGITS_LETTERS,DKIM_INVALID,
	DKIM_SIGNED,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 329BA2044A
	for <lists-other-nbd@bendel.debian.org>; Fri,  8 Apr 2022 11:53:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.789 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JOse6DVELiXX for <lists-other-nbd@bendel.debian.org>;
	Fri,  8 Apr 2022 11:52:54 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id BB0DE203BE
	for <nbd@other.debian.org>; Fri,  8 Apr 2022 11:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649418769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U07kLvVMtoVg6PM0wMMgx+xSaSBD4u+R8GcD1ebdn5s=;
	b=KM05cF7CCEf9p9+XxZYce1FhAY0z2WjO3vkRTNZcgLvq+Kf12XfBPj5kD4P9p6WJa5U0Wy
	9SU2CfvqB1ecHScGQqoDvUO6GjdIR2+NBQqWhXwzrizwibT/Ic+hRDNMFbCH/771erhNUg
	Lc9qYpGu2OQk4Vfl5Ytzizso7Yiv7o4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-BfdU4-H0M1CZ-nbcJA_FBQ-1; Fri, 08 Apr 2022 07:52:46 -0400
X-MC-Unique: BfdU4-H0M1CZ-nbcJA_FBQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED7012A5957E;
	Fri,  8 Apr 2022 11:52:45 +0000 (UTC)
Received: from localhost (unknown [10.39.192.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E6F7145B97F;
	Fri,  8 Apr 2022 11:52:45 +0000 (UTC)
Date: Fri, 8 Apr 2022 12:52:44 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: Eric Blake <eblake@redhat.com>, v.sementsov-og@mail.ru,
	qemu-block@nongnu.org, libguestfs@redhat.com, nbd@other.debian.org
Subject: Re: [Libguestfs] [PATCH 1/2] spec: Recommend cap on
 NBD_REPLY_TYPE_BLOCK_STATUS length
Message-ID: <20220408115244.GL8021@redhat.com>
References: <20220407213720.250252-1-eblake@redhat.com>
 <20220407213720.250252-2-eblake@redhat.com>
 <Yk/jTZcHpW5qWsvg@pc181009.grep.be>
MIME-Version: 1.0
In-Reply-To: <Yk/jTZcHpW5qWsvg@pc181009.grep.be>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="9crTWz/Z+Zyzu20v"
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <LaVOBF1B3mN.A.uJD.kICUiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1926
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220408115244.GL8021@redhat.com
Resent-Date: Fri,  8 Apr 2022 11:53:08 +0000 (UTC)

--9crTWz/Z+Zyzu20v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 08, 2022 at 09:25:01AM +0200, Wouter Verhelst wrote:
> Hi Eric,
> 
> On Thu, Apr 07, 2022 at 04:37:19PM -0500, Eric Blake wrote:
> > The spec was silent on how many extents a server could reply with.
> > However, both qemu and nbdkit (the two server implementations known to
> > have implemented the NBD_CMD_BLOCK_STATUS extension) implement a hard
> > cap, and will truncate the amount of extents in a reply to avoid
> > sending a client a reply larger than the maximum NBD_CMD_READ response
> > they are willing to tolerate:
> > 
> > When qemu first implemented NBD_CMD_BLOCK_STATUS for the
> > base:allocation context (qemu commit e7b1948d51, Mar 2018), it behaved
> > as if NBD_CMD_FLAG_REQ_ONE were always passed by the client, and never
> > responded with more than one extent.  Later, when adding its
> > qemu:dirty-bitmap:XXX context extension (qemu commit 3d068aff16, Jun
> > 2018), it added a cap to 128k extents (1M+4 bytes), and that cap was
> > applied to base:allocation once qemu started sending multiple extents
> > for that context as well (qemu commit fb7afc797e, Jul 2018).  Qemu
> > extents are never smaller than 512 bytes (other than an exception at
> > the end of a file whose size is not aligned to 512), but even so, a
> > request for just under 4G of block status could produce 8M extents,
> > resulting in a reply of 64M if it were not capped smaller.
> > 
> > When nbdkit first implemented NBD_CMD_BLOCK_STATUS (nbdkit 4ca66f70a5,
> > Mar 2019), it did not impose any restriction on the number of extents
> > in the reply chunk.  But because it allows extents as small as one
> > byte, it is easy to write a server that can amplify a client's request
> > of status over 1M of the image into a reply over 8M in size, and it
> > was very easy to demonstrate that a hard cap was needed to avoid
> > crashing clients or otherwise killing the connection (a bad server
> > impacting the client negatively); unique to nbdkit's situation is the
> > fact that because it is designed for plugin server implementations,
> > not capping the length of extent also posed a problem to nbdkit as the
> > server (a client requesting large block status could cause the server
> > to run out of memory depending on the plugin providing the server
> > callbacks).  So nbdkit enforced a bound of 1M extents (8M+4 bytes,
> > nbdkit commit 6e0dc839ea, Jun 2019).
> > 
> > Since the limit chosen by these two implementations is different, and
> > since nbdkit has versions that were not limited, add this as a SHOULD
> > NOT instead of MUST NOT constraint on servers implementing block
> > status.  It does not matter that qemu picked a smaller limit that it
> > truncates to, since we have already documented that the server may
> > truncate for other reasons (such as it being inefficient to collect
> > that many extents in the first place).  But documenting the limit now
> > becomes even more important in the face of a future addition of 64-bit
> > requests, where a client's request is no longer bounded to 4G and
> > could thereby produce even more than 8M extents for the corner case
> > when every 512 bytes is a new extent, if it were not for this
> > recommendation.
> 
> It feels backwards to me to make this a restriction on the server side.
> You're saying there are server implementations that will be inefficient
> if there are more than 2^20 extents, and therefore no server should send
> more than those, even if it can do so efficiently.
> 
> Isn't it up to the server implementation to decide what can be done
> efficiently?
> 
> Perhaps we can make the language about possibly reducing length of
> extens a bit stronger; but I don't think adding explicit limits for a
> server's own protection is necessary.

I agree, but for a different reason.

I think Eric should add language that servers can consider limiting
response sizes in order to prevent possible amplification issues
and/or simply overwhelming the client with work (bad server DoS
attacks against clients are a thing!), but I don't think it's
necessarily a "SHOULD" issue.

BTW attached is an nbdkit plugin that creates an NBD server that
responds with massive numbers of byte-granularity extents, in case
anyone wants to test how nbdkit and/or clients respond:

$ chmod +x /var/tmp/lots-of-extents.py
$ /var/tmp/lots-of-extents.py -f

$ nbdinfo --map nbd://localhost | head
         0           1    3  hole,zero
         1           1    0  data
         2           1    3  hole,zero
         3           1    0  data
         4           1    3  hole,zero
         5           1    0  data
         6           1    3  hole,zero
         7           1    0  data
         8           1    3  hole,zero
         9           1    0  data
$ nbdinfo --map --totals nbd://localhost 
    524288  50.0%   0 data
    524288  50.0%   3 hole,zero

>From experimentation I found this really hurts my laptop :-(

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
nbdkit - Flexible, fast NBD server with plugins
https://gitlab.com/nbdkit/nbdkit

--9crTWz/Z+Zyzu20v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lots-of-extents.py"

#!/usr/sbin/nbdkit python
API_VERSION = 2

def open(readonly):
    return 1

def get_size(h):
    return 1024*1024

def pread(h, buf, offset, flags):
    buf[:] = bytearray(len(buf))

def typ(offset):
    if offset % 2:
        return 0 # data
    else:
        return 3 # zero + hole

def extents(h, count, offset, flags):
    e = [(i, 1, typ(i)) for i in range(offset, offset + count + 1)]
    return e

--9crTWz/Z+Zyzu20v--

