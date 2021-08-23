Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 881273F4F68
	for <lists+nbd@lfdr.de>; Mon, 23 Aug 2021 19:20:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 314E820CA7; Mon, 23 Aug 2021 17:20:55 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 23 17:20:55 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F34D120C5D
	for <lists-other-nbd@bendel.debian.org>; Mon, 23 Aug 2021 17:20:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.375 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.474, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id WHgPkpIV7Jhu for <lists-other-nbd@bendel.debian.org>;
	Mon, 23 Aug 2021 17:20:42 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 52E4320C89
	for <nbd@other.debian.org>; Mon, 23 Aug 2021 17:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629739237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tZuugr64Uk6H2i1bs/0r+iPo4tTqz5ZFZVPhMvlzuQc=;
	b=JJec6MBsutHJZxxBoee8NvxgEMMRy48DgtupE9T07ptTwlyvepyXk2C8TtXlNK8mJrAo8I
	jXvIuWS8TGIE//ocFhDQMcPkOx2OUuHYHXnOM9nsLjFZAd5OUh6Envk3laAEnwsFWf2WPQ
	q15YFG+JGJ/G3IeEBe0stY79dEzeaZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-jGpWAMtePh-VuqVWIqwrDQ-1; Mon, 23 Aug 2021 13:20:34 -0400
X-MC-Unique: jGpWAMtePh-VuqVWIqwrDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8EB0107ACF5;
	Mon, 23 Aug 2021 17:20:32 +0000 (UTC)
Received: from redhat.com (ovpn-112-192.phx2.redhat.com [10.3.112.192])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC00E60C82;
	Mon, 23 Aug 2021 17:20:28 +0000 (UTC)
Date: Mon, 23 Aug 2021 12:20:26 -0500
From: Eric Blake <eblake@redhat.com>
To: Abhay Raj Singh <rathod.sahaab@gmail.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>, libguestfs@redhat.com,
	nbd@other.debian.org
Subject: Re: [Libguestfs] nbdcpy: from scratch nbdcopy using io_uring
Message-ID: <20210823172026.dxunchzbofjg27wk@redhat.com>
References: <20210624182714.GG30099@redhat.com>
 <CAAXt=1C9tBwc6wkrtFz=Fdgp0CccMSvj-BGVbncXJgLXWRwbjA@mail.gmail.com>
 <20210625085904.GI26415@redhat.com>
 <CAAXt=1AU0QH=PZ+Bx=_1=GZ7rTDMfr0e4M53rHnyw=mV2o_rQg@mail.gmail.com>
 <20210710075756.GX26415@redhat.com>
 <CAAXt=1CK3LHrsmC_nK8yqqufYBZiGgcjVXOakDjVULH+QhLa4A@mail.gmail.com>
 <20210731183900.GU26415@redhat.com>
 <CAAXt=1AHofuOUHLjpJ8BkfkXp2qxZWtwP76ireaXvg_gu-By_Q@mail.gmail.com>
 <20210807180805.GO26415@redhat.com>
 <CAAXt=1AJdzeMCdnBo4fqPQjetKJN-73CS7_Ln60Axr3EAfn3+w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAXt=1AJdzeMCdnBo4fqPQjetKJN-73CS7_Ln60Axr3EAfn3+w@mail.gmail.com>
User-Agent: NeoMutt/20210205-733-8f834e
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vKEH-oF6fh.A.AFE.3j9IhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1307
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210823172026.dxunchzbofjg27wk@redhat.com
Resent-Date: Mon, 23 Aug 2021 17:20:55 +0000 (UTC)

[adding the NBD list into cc]

On Mon, Aug 23, 2021 at 09:26:34PM +0530, Abhay Raj Singh wrote:
> I had an idea for optimizing my current approach, it's good in some
> ways but can be faster with some breaking changes to the protocol.
> 
> Currently, we read (from socket connected to source) one request at a time
> the simple flow looks like `read_header(io_uring) ---- success --->
> recv(data) --- success ---> send(data) & queue another read header`
> but it's not as efficient as it could be at best it's a hack.
> 
> Another approach I am thinking about is a large buffer
> where we can read all of the socket's data and process packets from
> that buffer as all the I/O is handled.
> this minimizes the number of read requests to the kernel as we do 1
> read for multiple NBD packets.
> 
> Further optimization requires changing the NBD protocol a bit
> Current protocol
> 1. Memory representation of a response (20-byte header + data)
> 2. Memory representation of a request (28-byte header + data)
> 
> HHHHH_DDDDDDDDD...
> HHHHHHH_DDDDDDDDD...
> 
> H and D represent 4 bytes, _ represents 0 bytes

You are correct that requests are currently 28 bytes header plus any
payload (where payload is currently only in NBD_CMD_WRITE).  But
responses are two different lengths: simple responses are 16 bytes +
payload (payload only for NBD_CMD_READ, and only if structured replies
not negotiated), while structured responses are 20 bytes + payload
(but while NBD_CMD_READ and NBD_CMD_BLOCK_STATUS require structured
replies, a compliant server can still send simple replies to other
commands).  So it's even trickier than you represent here, as reading
20-byte headers of a reply is not going to always do the right thing.

> 
> With the large buffer approach, we read data into a large buffer, then
> copy the NBD packet's data to a new buffer, strap a new header to it
> and send it.
> This copying is what we wanted to avoid in the first place.
> 
> If the response header was 28 bytes or the first 8-bytes of data were
> useless we could have just overwritten the header part and sent data
> directly from the large buffer, therefore avoiding the copy.
> 
> What are your thoughts?

There's already discussions about what it would take to extend the NBD
protocol to support 64-bit requests (not that we'd want to go beyond
current server restrictions of 32M or 64M maximum NBD_CMD_READ and
NBD_CMD_WRITE, but more so we can permit quick image zeroing via a
64-bit NBD_CMD_WRITE_ZEROES).  Your observation that having the
request and response headers be equally sized for more efficient
handling is worthwhile to consider in making such a protocol extension
- of necessity, it would have to be via an NBD_OPT_* option requested
by the client during negotiation and responded to affirmatively by the
server, before both sides then use the new-size packets in both
directions after NBD_OPT_GO (and a client would still have to be
prepared to fall back to the unequal-sized headers if the server
doesn't understand the option).

For that matter, is there a benefit to having cache-line-optimized
sizing, where all headers are exactly 32 bytes (both requests and
responses, and both simple and structured replies)?  I'm thinking
maybe NBD_OPT_FIXED_SIZE_HEADER might be a sane name for such an
option.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

