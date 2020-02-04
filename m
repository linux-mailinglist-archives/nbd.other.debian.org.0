Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA96151B7A
	for <lists+nbd@lfdr.de>; Tue,  4 Feb 2020 14:41:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9424B20358; Tue,  4 Feb 2020 13:41:48 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb  4 13:41:48 2020
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5314920345
	for <lists-other-nbd@bendel.debian.org>; Tue,  4 Feb 2020 13:41:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.201 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id dyePTwv1R5Qd for <lists-other-nbd@bendel.debian.org>;
	Tue,  4 Feb 2020 13:41:35 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by bendel.debian.org (Postfix) with ESMTP id ABD5B200B5
	for <nbd@other.debian.org>; Tue,  4 Feb 2020 13:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580823677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=igQ7JNP4nvg8EhcB+/jd3Wl4DwP0tcBD5n/qp0l+CtA=;
	b=Kax1h4TKSCR211Hq+9YO67f5jPTo5TOSoOSfeCu/NomIN62s456WmNWGN4uydCU1BH8XdQ
	+lUWXRDXY66jIB92QlbrMWkP3v/dfRBkwp1BmX8KQIHCcgEnKxvBiE1EdgWjGh+AUu79qk
	Sz9tcFU5KBnRIahjC3tbp5Qahf9ChlU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-dboGTiNGN-ub-fsQ-PB4bA-1; Tue, 04 Feb 2020 08:41:14 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A91F61263;
	Tue,  4 Feb 2020 13:41:12 +0000 (UTC)
Received: from [10.3.116.181] (ovpn-116-181.phx2.redhat.com [10.3.116.181])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63F7A60BF3;
	Tue,  4 Feb 2020 13:41:11 +0000 (UTC)
Subject: Re: NBD extended (or structured?) request
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "nbd@other.debian.org" <nbd@other.debian.org>
Cc: qemu block <qemu-block@nongnu.org>, Wouter Verhelst <w@uter.be>,
 Nir Soffer <nsoffer@redhat.com>, "Denis V. Lunev" <den@openvz.org>
References: <e5129916-6664-18b0-6e4e-d3089553b735@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <59d0be5a-c881-6d8f-7a63-51e935cbc3ce@redhat.com>
Date: Tue, 4 Feb 2020 07:41:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e5129916-6664-18b0-6e4e-d3089553b735@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: dboGTiNGN-ub-fsQ-PB4bA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vphpq9CB4eE.A.BZG.cSXOeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/791
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/59d0be5a-c881-6d8f-7a63-51e935cbc3ce@redhat.com
Resent-Date: Tue,  4 Feb 2020 13:41:48 +0000 (UTC)

On 2/4/20 7:01 AM, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> There are some ideas, which needs extra arguments in NBD request:
> 
> 1. Selecting metacontext for NBD_BLOCK_STATUS [Nir], possibly through new
> command, instead of extending the original [Wouter]
> 
> 2. 64bit block-status/write-zeroes [I know about Eric's work on all-zero 
> check,
> but I think, that 32bit is too restrictive for data-less commands anyway,
> skipping and fast-zeroing larger chunks would be profitable in different
> scenarios)
> 
> 
> I imagine two possibilities:
> 
> 1. Just new request magic, negotiated by server flag, with structure like
> 
> 64bits magic
> 32bits command
> 64bits handle
> 32bits length of payload
> * payload

Here's previous discussion on adding 64-bit commands, where we could 
also work this in:

https://lists.debian.org/nbd/2018/09/msg00001.html

We definitely need a new magic number for clients to let the server know 
it is sending a structured request, as well as handshaking (the server 
must advertise support for structured requests before a client can send 
them).  Similar to structured replies, we should require that all 
structured requests include a payload length in addition to any length 
parameter for the portion of the image the request is related to.

> 
> 2. Or we can go further, and just take existing structured reply, allowing
> requests with same semantics. We even can reuse the magic (but of course 
> need
> new server negotiation flag)
> 
> Remember that structured reply chunk has structure:
> 32bits magic
> 16bits flags
> 16bits type
> 64bits handle
> 32bits length of payload
> * payload

Even if we reuse the structured reply magic for structured requests, it 
still looks like a new magic number for requests, and you are correct 
that it requires proper handshaking before either side can use the 
extension.

> 
> And then, on command may consist from several chunks, the last one must 
> contain
> flag NBD_REPLY_FLAG_DONE (hmm, we'll need to rename it to just
> NBD_STRUCTURED_CHUNK_FLAG_DONE). I think, that server even may start to 
> reply
> (send some structured reply chunks) before collecting all request chunks :)
> 
> This will also make possible to implement structured write, which may be 
> useful
> in a scenario, when we read from one NBD and write to another, we can keep
> structured read result and pass it directly to structured write.
> 
> ===
> 
> Then, we can add extended commands, like NBD_CMD_WRITE_ZEROES_64, with 
> 8-bytes
> payload:
> 64bits offset
> 64bits length
> 
> We can add 32bits or 16bits flags here, or we can use flags field of the
> structured chunk, to store some command flags.
> 
> We can use same flags/type for this NBD_CMD_WRITE_ZEROES_64 as for
> NBD_CMD_WRITE_ZEROES, or use new type.
> 
> Also, it's a question, should it be considered as absolutely new 
> command, or
> maybe better to alter existing description of NBD_CMD_WRITE_ZEROES to 
> support
> 64bit feature.
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

