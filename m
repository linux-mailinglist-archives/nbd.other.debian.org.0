Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C394158592
	for <lists+nbd@lfdr.de>; Mon, 10 Feb 2020 23:30:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 343C1203EA; Mon, 10 Feb 2020 22:30:46 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb 10 22:30:46 2020
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A7ED4203D9
	for <lists-other-nbd@bendel.debian.org>; Mon, 10 Feb 2020 22:30:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 0he8Vju4GiCy for <lists-other-nbd@bendel.debian.org>;
	Mon, 10 Feb 2020 22:30:34 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by bendel.debian.org (Postfix) with ESMTP id 2FC0820373
	for <nbd@other.debian.org>; Mon, 10 Feb 2020 22:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581373828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ndWJYrJDqYVWn5Nd+TybwT3Eg8HqEeF8V1B3jDFRXaA=;
	b=QrYtQpmrfCoeICgjTyueHQ1+6iULIA3wNuWf7ECdMC7UltxHC3l9bgBj2J3tP6imj5hhfg
	ksi/xVLRCu0/EGq4HAPF2PeTFjxZJibilX0ou0VVwCj//k2/8RrpMInu4m8thTJzQ1zKa9
	42mZThuCEUGWkZNASqAZ3tegnlylB6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-shvBQj_jMsGEgMCNZpUZsQ-1; Mon, 10 Feb 2020 17:29:59 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D286F800D5B;
	Mon, 10 Feb 2020 22:29:57 +0000 (UTC)
Received: from [10.3.116.180] (ovpn-116-180.phx2.redhat.com [10.3.116.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59BDE5C1D4;
	Mon, 10 Feb 2020 22:29:54 +0000 (UTC)
Subject: Re: Cross-project NBD extension proposal: NBD_INFO_INIT_STATE
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: "nbd@other.debian.org" <nbd@other.debian.org>,
 QEMU <qemu-devel@nongnu.org>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "libguestfs@redhat.com" <libguestfs@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>
References: <a4394fde-f459-dcb5-1698-013e1e24c388@redhat.com>
 <20200210221234.GH3888@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <cc6e1e2e-d3a9-c498-354b-d382b5623ca0@redhat.com>
Date: Mon, 10 Feb 2020 16:29:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210221234.GH3888@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: shvBQj_jMsGEgMCNZpUZsQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <41ZGX_10E2M.A.AnC.WmdQeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/810
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/cc6e1e2e-d3a9-c498-354b-d382b5623ca0@redhat.com
Resent-Date: Mon, 10 Feb 2020 22:30:46 +0000 (UTC)

On 2/10/20 4:12 PM, Richard W.M. Jones wrote:
> On Mon, Feb 10, 2020 at 03:37:20PM -0600, Eric Blake wrote:
>> For now, only 2 of those 16 bits are defined: NBD_INIT_SPARSE (the
>> image has at least one hole) and NBD_INIT_ZERO (the image reads
>> completely as zero); the two bits are orthogonal and can be set
>> independently, although it is easy enough to see completely sparse
>> files with both bits set.
> 
> I think I'm confused about the exact meaning of NBD_INIT_SPARSE.  Do
> you really mean the whole image is sparse; or (as you seem to have
> said above) that there exists a hole somewhere in the image but we're
> not saying where it is and there can be non-sparse parts of the image?

As implemented:

NBD_INIT_SPARSE - there is at least one hole somewhere (allocation would 
be required to write to that part of the file), but there may b 
allocated data elsewhere in the image.  Most disk images will fit this 
definition (for example, it is very common to have a hole between the 
MBR or GPT and the first partition containing a file system, or for file 
systems themselves to be sparse within the larger block device).

NBD_INIT_ZERO - all bytes read as zero.

The combination NBD_INIT_SPARSE|NBD_INIT_ZERO is common (generally, if 
you use lseek(SEEK_DATA) to prove the entire image reads as zeroes, you 
also know the entire image is sparse), but NBD_INIT_ZERO in isolation is 
also possible (especially with the qcow2 proposal of a persistent 
autoclear bit, where even with a fully preallocated qcow2 image you 
still know it reads as zeroes but there are no holes).  But you are also 
right that for servers that can advertise both bits efficiently, 
NBD_INIT_SPARSE in isolation may be more common than 
NBD_INIT_SPARSE|NBD_INIT_ZERO (the former for most disk images, the 
latter only for a freshly-created image that happens to create with zero 
initialization).

What's more, in my patches, I did NOT patch qemu to set or consume 
INIT_SPARSE; so far, it only sets/consumes INIT_ZERO.  Of course, if we 
can find a reason WHY qemu should track whether a qcow2 image is 
fully-allocated, by demonstrating a qemu-img algorithm that becomes 
easier for knowing if an image is sparse (even if our justification is: 
"when copying an image, I want to know if the _source_ is sparse, to 
know whether I have to bend over backwards to preallocate the 
destination"), then using that in qemu makes sense for my v2 patches. 
But for v1, my only justification was "when copying an image, I can skip 
holes in the source if I know the _destination_ already reads as 
zeroes", which only needed INIT_ZERO.

Some of the nbdkit patches demonstrate the some-vs.-all nature of the 
two bits; for example, in the split plugin, I initialize h->init_sparse 
= false; h->init_zero = true; then in a loop over each file change 
h->init_sparse to true if at least one file was sparse, and change 
h->init_zero to false if at least one file had non-zero contents.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

