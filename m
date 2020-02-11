Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F89159203
	for <lists+nbd@lfdr.de>; Tue, 11 Feb 2020 15:34:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7A17A204CA; Tue, 11 Feb 2020 14:34:01 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb 11 14:34:01 2020
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C4970204BA
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Feb 2020 14:33:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.201 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id kAVCFa2DpnCJ for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Feb 2020 14:33:49 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by bendel.debian.org (Postfix) with ESMTP id EF92B204B8
	for <nbd@other.debian.org>; Tue, 11 Feb 2020 14:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581431623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bz6LXVsoI66LuUac2rYRL3fWGQcpAXi7rFujqid6psU=;
	b=Fy6y88dfQnZKjqVdDdDBD5xt/uPdElSbVamLTol9MuwiG+P870+mEdDvNLER+JboyWsG81
	nDcijzofSXDu3+GZA0m/louztprJTzN723ZnFkMahwWcbEhy1ZlriKnZGiHxD2KpvyS1wb
	cnZ5ML2JA5jK7XIBRDHx/SF4EUZurm0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-0TpUnLkwOsaXtrymsb3Cig-1; Tue, 11 Feb 2020 09:33:32 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B74F800EB2;
	Tue, 11 Feb 2020 14:33:31 +0000 (UTC)
Received: from [10.3.116.180] (ovpn-116-180.phx2.redhat.com [10.3.116.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34A1189F35;
	Tue, 11 Feb 2020 14:33:26 +0000 (UTC)
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
 <cc6e1e2e-d3a9-c498-354b-d382b5623ca0@redhat.com>
 <20200210225255.GJ3888@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <6ac74a99-67b6-3c41-873f-174237412605@redhat.com>
Date: Tue, 11 Feb 2020 08:33:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210225255.GJ3888@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 0TpUnLkwOsaXtrymsb3Cig-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-vmQV31obRM.A.AmD.ZtrQeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/813
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6ac74a99-67b6-3c41-873f-174237412605@redhat.com
Resent-Date: Tue, 11 Feb 2020 14:34:01 +0000 (UTC)

On 2/10/20 4:52 PM, Richard W.M. Jones wrote:
> On Mon, Feb 10, 2020 at 04:29:53PM -0600, Eric Blake wrote:
>> On 2/10/20 4:12 PM, Richard W.M. Jones wrote:
>>> On Mon, Feb 10, 2020 at 03:37:20PM -0600, Eric Blake wrote:
>>>> For now, only 2 of those 16 bits are defined: NBD_INIT_SPARSE (the
>>>> image has at least one hole) and NBD_INIT_ZERO (the image reads
>>>> completely as zero); the two bits are orthogonal and can be set
>>>> independently, although it is easy enough to see completely sparse
>>>> files with both bits set.
>>>
>>> I think I'm confused about the exact meaning of NBD_INIT_SPARSE.  Do
>>> you really mean the whole image is sparse; or (as you seem to have
>>> said above) that there exists a hole somewhere in the image but we're
>>> not saying where it is and there can be non-sparse parts of the image?
>>
>> As implemented:
>>
>> NBD_INIT_SPARSE - there is at least one hole somewhere (allocation
>> would be required to write to that part of the file), but there may
>> b allocated data elsewhere in the image.  Most disk images will fit
>> this definition (for example, it is very common to have a hole
>> between the MBR or GPT and the first partition containing a file
>> system, or for file systems themselves to be sparse within the
>> larger block device).
> 
> I think I'm still confused about why this particular flag would be
> useful for clients (I can completely understand why clients need
> NBD_INIT_ZERO).
> 
> But anyway ... could a flag indicating that the whole image is sparse
> be useful, either as well as NBD_INIT_SPARSE or instead of it?  You
> could use it to avoid an initial disk trim, which is something that
> mke2fs does:
> 
>    https://github.com/tytso/e2fsprogs/blob/0670fc20df4a4bbbeb0edb30d82628ea30a80598/misc/mke2fs.c#L2768

I'm open to suggestions on how many initial bits should be provided.  In 
fact, if we wanted, we could have a pair mutually-exclusive bits, 
advertising:
00 - no information known
01 - image is completely sparse
10 - image is completely allocated
11 - error

The goal of providing a 16-bit answer (or we could mandate 32 or 64 
bits, if we think we will ever want to extend that far) was to make it 
easier to add in whatever other initial-state extensions that someone 
could find useful.  Until we're happy with the design, the size or any 
given bit assignment is not locked down; once we do start committing any 
of this series, we've locked in what interoperability will demand but 
still have spare bits as future extensions.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

