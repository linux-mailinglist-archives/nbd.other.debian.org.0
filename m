Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id EA537632FAA
	for <lists+nbd@lfdr.de>; Mon, 21 Nov 2022 23:18:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AF735205E6; Mon, 21 Nov 2022 22:18:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 21 22:18:12 2022
Old-Return-Path: <bcodding@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E0887205B5
	for <lists-other-nbd@bendel.debian.org>; Mon, 21 Nov 2022 22:02:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.304 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1,
	DKIMWL_WL_HIGH=-0.515, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MD5_SHA1_SUM=-1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VXmul7S97BTX for <lists-other-nbd@bendel.debian.org>;
	Mon, 21 Nov 2022 22:02:20 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 0983B205A7
	for <nbd@other.debian.org>; Mon, 21 Nov 2022 22:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669068134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YMKd/Bs7qgKxK3d2yDLuSvYLpTNEB6rexVneY8E6It8=;
	b=J9UbiYc/SxnBN1Q4GYUNXqPoHIQoZz3s0CMMTfMeLrQpY46MEy+rvt5XkKYejLJGUQbubI
	2/o0ezqglDL8pqHTdaQeIclsMB4sDG2+yOdwknNdkSz62YJ7V52069EInm+mwhICvqtctg
	AYU2WoT5C99V18BEVJOlGZhogdJIjOQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-BCJecrIfN9ORT1g62yEryw-1; Mon, 21 Nov 2022 17:02:12 -0500
X-MC-Unique: BCJecrIfN9ORT1g62yEryw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4575101A5C0;
	Mon, 21 Nov 2022 22:02:03 +0000 (UTC)
Received: from [172.16.176.1] (unknown [10.22.50.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B2304EA47;
	Mon, 21 Nov 2022 22:01:46 +0000 (UTC)
From: Benjamin Coddington <bcodding@redhat.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: David Howells <dhowells@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Lee Duncan <lduncan@suse.com>,
 Chris Leech <cleech@redhat.com>, Mike Christie <michael.christie@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marc Dionne <marc.dionne@auristor.com>, Steve French <sfrench@samba.org>,
 Christine Caulfield <ccaulfie@redhat.com>,
 David Teigland <teigland@redhat.com>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Eric Van Hensbergen <ericvh@gmail.com>, Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Jeff Layton <jlayton@kernel.org>, drbd-dev@lists.linbit.com,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-nvme@lists.infradead.org, open-iscsi@googlegroups.com,
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, cluster-devel@redhat.com,
 ocfs2-devel@oss.oracle.com, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org
Subject: Re: [PATCH v1 2/3] Treewide: Stop corrupting socket's task_frag
Date: Mon, 21 Nov 2022 17:01:42 -0500
Message-ID: <A860595D-5BAB-461B-B449-8975C0424311@redhat.com>
In-Reply-To: <26d98c8f-372b-b9c8-c29f-096cddaff149@linuxfoundation.org>
References: <c2ec184226acd21a191ccc1aa46a1d7e43ca7104.1669036433.git.bcodding@redhat.com>
 <cover.1669036433.git.bcodding@redhat.com>
 <382872.1669039019@warthog.procyon.org.uk>
 <51B5418D-34FB-4E87-B87A-6C3FCDF8B21C@redhat.com>
 <4585e331-03ad-959f-e715-29af15f63712@linuxfoundation.org>
 <26d98c8f-372b-b9c8-c29f-096cddaff149@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <iJ18j0lFGUG.A.t7E.kk_ejB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2299
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/A860595D-5BAB-461B-B449-8975C0424311@redhat.com
Resent-Date: Mon, 21 Nov 2022 22:18:12 +0000 (UTC)

On 21 Nov 2022, at 16:43, Shuah Khan wrote:

> On 11/21/22 14:40, Shuah Khan wrote:
>> On 11/21/22 07:34, Benjamin Coddington wrote:
>>> On 21 Nov 2022, at 8:56, David Howells wrote:
>>>
>>>> Benjamin Coddington <bcodding@redhat.com> wrote:
>>>>
>>>>> Since moving to memalloc_nofs_save/restore, SUNRPC has stopped sett=
ing the
>>>>> GFP_NOIO flag on sk_allocation which the networking system uses to =
decide
>>>>> when it is safe to use current->task_frag.
>>>>
>>>> Um, what's task_frag?
>>>
>>> Its a per-task page_frag used to coalesce small writes for networking=
 -- see:
>>>
>>> 5640f7685831 net: use a per task frag allocator
>>>
>>> Ben
>>>
>>>
>>
>> I am not seeing this in the mainline. Where can find this commit?
>>
>
> Okay. I see this commit in the mainline. However, I don't see the
> sk_use_task_frag in mainline.

sk_use_task_frag is in patch 1/3 in this posting.

https://lore.kernel.org/netdev/26d98c8f-372b-b9c8-c29f-096cddaff149@linux=
foundation.org/T/#m3271959c4cf8dcff1c0c6ba023b2b3821d9e7e99

Ben

