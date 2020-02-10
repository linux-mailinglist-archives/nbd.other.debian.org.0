Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2151584D9
	for <lists+nbd@lfdr.de>; Mon, 10 Feb 2020 22:37:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E6B1B204B9; Mon, 10 Feb 2020 21:37:52 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb 10 21:37:52 2020
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3FD0C20484
	for <lists-other-nbd@bendel.debian.org>; Mon, 10 Feb 2020 21:37:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.101 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id KkLP9wMgR-fT for <lists-other-nbd@bendel.debian.org>;
	Mon, 10 Feb 2020 21:37:40 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL_SUBNET=-1.2 (check from: .redhat. - helo: .us-smtp-delivery-1.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -4.7
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by bendel.debian.org (Postfix) with ESMTP id 722E1204A2
	for <nbd@other.debian.org>; Mon, 10 Feb 2020 21:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581370653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FNPJLAwxlqp6XYsrI52R3aM36dx1U5zMd2uuI+0CAw4=;
	b=AWvNRD9+8P2VDGxAC2LTqPnzyGrmzMlCGw49HgQTwLRZ96iAkkRfKp/W76lV4jzkWZCNHo
	tehc1WUJ2SKIS92nLRx/DVPXkV3a28F8yNeF+aGZtw7bHc/eIYF/jv9uzq73j0arWypcRE
	KZ9/yFl/cNeLgytRvrDvANdIRhAeoHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-o5p4pWqfOUGlSo6mQhP9jA-1; Mon, 10 Feb 2020 16:37:26 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A55C08017CC;
	Mon, 10 Feb 2020 21:37:24 +0000 (UTC)
Received: from [10.3.116.180] (ovpn-116-180.phx2.redhat.com [10.3.116.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61FD35C1D4;
	Mon, 10 Feb 2020 21:37:21 +0000 (UTC)
To: "nbd@other.debian.org" <nbd@other.debian.org>,
 QEMU <qemu-devel@nongnu.org>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "libguestfs@redhat.com" <libguestfs@redhat.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>
From: Eric Blake <eblake@redhat.com>
Subject: Cross-project NBD extension proposal: NBD_INFO_INIT_STATE
Organization: Red Hat, Inc.
Message-ID: <a4394fde-f459-dcb5-1698-013e1e24c388@redhat.com>
Date: Mon, 10 Feb 2020 15:37:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: o5p4pWqfOUGlSo6mQhP9jA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <F7S-5z5ur6.A.yCD.w0cQeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/807
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/a4394fde-f459-dcb5-1698-013e1e24c388@redhat.com
Resent-Date: Mon, 10 Feb 2020 21:37:52 +0000 (UTC)

I will be following up to this email with four separate threads each 
addressed to the appropriate single list, with proposed changes to:
- the NBD protocol
- qemu: both server and client
- libnbd: client
- nbdkit: server

The feature in question adds a new optional NBD_INFO_ packet to the 
NBD_OPT_GO portion of handshake, adding up to 16 bits of information 
that the server can advertise to the client at connection time about any 
known initial state of the export [review to this series may propose 
slight changes, such as using 32 bits; but hopefully by having all four 
series posted in tandem it becomes easier to see whether any such tweaks 
are warranted, and can keep such tweaks interoperable before any of the 
projects land the series upstream].  For now, only 2 of those 16 bits 
are defined: NBD_INIT_SPARSE (the image has at least one hole) and 
NBD_INIT_ZERO (the image reads completely as zero); the two bits are 
orthogonal and can be set independently, although it is easy enough to 
see completely sparse files with both bits set.  Also, advertising the 
bits is orthogonal to whether the base:allocation metacontext is used, 
although a server with all possible extensions is likely to have the two 
concepts match one another.

The new bits are added as an information chunk rather than as runtime 
flags; this is because the intended client of this information is 
operations like copying a sparse image into an NBD server destination. 
Such a client only cares at initialization if it needs to perform a 
pre-zeroing pass or if it can rely on the destination already reading as 
zero.  Once the client starts making modifications, burdening the server 
with the ability to do a live runtime probe of current reads-as-zero 
state does not help the client, and burning per-export flags for 
something that quickly goes stale on the first edit was not thought to 
be wise, similarly, adding a new NBD_CMD did not seem worthwhile.

The existing 'qemu-img convert source... nbd://...' is the first command 
line example that can benefit from the new information; the goal of 
adding a protocol extension was to make this benefit automatic without 
the user having to specify the proposed --target-is-zero when possible. 
I have a similar thread pending for qemu which adds similar 
known-reads-zero information to qcow2 files:
https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg08075.html

That qemu series is at v1, and based on review it has had so far, it 
will need some interface changes for v2, which means my qemu series here 
will need a slight rebasing, but I'm posting this series to all lists 
now to at least demonstrate what is possible when we have better startup 
information.

Note that with this new bit, it is possible to learn if a destination is 
sparse as part of NBD_OPT_GO rather than having to use block-status 
commands.  With existing block-status commands, you can use an O(n) scan 
of block-status to learn if an image reads as all zeroes (or 
short-circuit in O(1) time if the first offset is reported as probable 
data rather than reading as zero); but with this new bit, the answer is 
O(1).  So even with Vladimir's recent change to make the spec permit 4G 
block-status even when max block size is 32M, or the proposed work to 
add 64-bit block-status, you still end up with more on-the-wire traffic 
for block-status to learn if an image is all zeroes than if the server 
just advertises this bit.  But by keeping both extensions orthogonal, a 
server can implement whichever one or both reporting methods it finds 
easiest, and a client can work with whatever a server supplies with sane 
fallbacks when the server lacks either extension.  Conversely, 
block-status tracks live changes to the image, while this bit is only 
valid at connection time.

My repo for each of the four projects contains a tag 'nbd-init-v1':
  https://repo.or.cz/nbd/ericb.git/shortlog/refs/tags/nbd-init-v1
  https://repo.or.cz/qemu/ericb.git/shortlog/refs/tags/nbd-init-v1
  https://repo.or.cz/libnbd/ericb.git/shortlog/refs/tags/nbd-init-v1
  https://repo.or.cz/nbdkit/ericb.git/shortlog/refs/tags/nbd-init-v1

For doing interoperability testing, I find it handy to use:

PATH=/path/to/built/qemu:/path/to/built/nbdkit:$PATH
/path/to/libnbd/run your command here

to pick up just-built qemu-nbd, nbdsh, and nbdkit that all support the 
feature.

For quickly setting flags:
nbdkit eval init_sparse='exit 0' init_zero='exit 0' ...

For quickly checking flags:
qemu-nbd --list ... | grep init
nbdsh -u uri... -c 'print(h.get_init_flags())'

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

