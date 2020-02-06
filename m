Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B10E8154484
	for <lists+nbd@lfdr.de>; Thu,  6 Feb 2020 14:06:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 81DBA20313; Thu,  6 Feb 2020 13:06:37 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb  6 13:06:37 2020
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 051C2202A3
	for <lists-other-nbd@bendel.debian.org>; Thu,  6 Feb 2020 13:06:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.081 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zis6CXXEmwlq for <lists-other-nbd@bendel.debian.org>;
	Thu,  6 Feb 2020 13:06:24 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by bendel.debian.org (Postfix) with ESMTP id 23E432029D
	for <nbd@other.debian.org>; Thu,  6 Feb 2020 13:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580994377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FCrsutWCEjiUqRO+tSEdklUnqTBVpa9mqq5EYHMn/Go=;
	b=M+DfcM0hpABZlqDaQzQEFk+mxaQ0Ja/nn4E3NHe4rC4R8h+2hZ/8x6LH+ipMmDuKUzak1Z
	zzmWwhb3Z7xDbyDvvsMXRcE4O431PxXsbn7LrK7Yu2JE0Pj2j/ZTtVULaZ9YWzKSzu0sHo
	HyIXStZX3jxH0C1CPRaAxeUodRcPyjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-3r_7RcPxOPmtN_2yY5L-0Q-1; Thu, 06 Feb 2020 08:06:02 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF1238F25E1;
	Thu,  6 Feb 2020 13:06:00 +0000 (UTC)
Received: from [10.3.116.181] (ovpn-116-181.phx2.redhat.com [10.3.116.181])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C10460FC1;
	Thu,  6 Feb 2020 13:05:59 +0000 (UTC)
Subject: Re: [PATCH 1/2] nbd/proto: introduce structured request
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 nbd@other.debian.org
Cc: qemu-block@nongnu.org, w@uter.be, nsoffer@redhat.com, den@openvz.org
References: <20200205164352.16673-1-vsementsov@virtuozzo.com>
 <20200205164352.16673-2-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5e72ec19-604e-5840-a164-4b7ab0222a3e@redhat.com>
Date: Thu, 6 Feb 2020 07:05:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200205164352.16673-2-vsementsov@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 3r_7RcPxOPmtN_2yY5L-0Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <sNohcuwzUQE.A.CcB.d9APeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/796
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5e72ec19-604e-5840-a164-4b7ab0222a3e@redhat.com
Resent-Date: Thu,  6 Feb 2020 13:06:37 +0000 (UTC)

On 2/5/20 10:43 AM, Vladimir Sementsov-Ogievskiy wrote:
> Idea: reuse structured replies as requests too. For this:
> 
> Rename structured reply "structure" to structured message. And,
> correspondingly structured reply chunk to structured message chunk.
> 
> Keep name "structured reply" for structured messages sent by server,
> and name "structured request" a structured message sent by client.
> 
> Share almost all semantics around structured messages for client and
> server except for chunk type (as reply types and request types are
> orthogonal things). Still, share none-type chunk for both server and
> client.
> 

Without looking at the doc patch itself, my initial worry is as follows:

For structured replies, we needed the ability to allow a server to have 
split replies (sparse reads were the primary reason behind that decision 
- the client does not know a priori which portions of the image are 
sparse, and the server needs some way to represent both data and holes 
each as efficiently as possible over the wire for a single read 
request).  On the client side, this means that either the client has to 
track enough state to reassemble multiple server messages intermixed 
with one another, or the client can choose to serialize things so that 
the server only ever has at most one outstanding command.  On the server 
side, some servers may already be smart enough to handle interleaved 
client requests such that structured replies can indeed end up 
interleaved, while others may serialize how they react to incoming 
client messages and send all chunks of a given reply (in the few cases 
where sending more than one chunk even makes sense) before parsing the 
next client message.  Thus, while the protocol permits interleaving, it 
does not force either side to implement interleaving.

But if we allow structured requests to be split across multiple packets, 
we either have to mandate that clients CANNOT split requests across 
multiple packets, or we are FORCING the server to track additional state 
to deal with clients that fragment and interleave requests, even if most 
clients don't do that.  While split replies make sense, I'm having a 
hard time seeing how split requests would ever be useful (a client does 
not need to try to do a write with holes in a single request; instead, 
write the data and write the holes via two separate write requests over 
smaller portions of the export).  So while we may want to reuse the 
magic number and on-the-wire format of a structured message, I'd 
strongly argue that structured requests must be documented in a way that 
makes it obvious that they will always occupy exactly one chunk 
(reserving multiple chunks and the need for the DONE flag only for replies).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

