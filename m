Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IWTCUeJxWlc+wQAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Thu, 26 Mar 2026 20:30:15 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F3533AF38
	for <lists+nbd@lfdr.de>; Thu, 26 Mar 2026 20:30:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6E3CC206BE; Thu, 26 Mar 2026 19:30:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 26 19:30:14 2026
Old-Return-Path: <lkp@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MD5_SHA1_SUM,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	TO_TOO_MANY autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1E76220658
	for <lists-other-nbd@bendel.debian.org>; Thu, 26 Mar 2026 19:14:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.499 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3sAQ1Q9xgT6b for <lists-other-nbd@bendel.debian.org>;
	Thu, 26 Mar 2026 19:14:07 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .intel. - helo: .mgamail.intel. - helo-domain: .intel.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mgamail.intel.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B58A92068C
	for <nbd@other.debian.org>; Thu, 26 Mar 2026 19:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774552447; x=1806088447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tltjxf8jFcPq7OEubyq8By6LslzVEqdhOSnFAcg5Ie4=;
  b=blzrxvhdUwVkaODgiv0UOWplLkY6nscmZFbFPMbtALdRDf7FUbt/ZZD/
   Cp1d5ICNBce9Thxxae9AdzCAx388sEzp6sEfReROysnv4nWx2CV1LMbc2
   G6GYhpjBH+JgMbSK7/o7d4qKZ3MLpKtpK4QZKYoBi+Kbm1ouEzMFeYzO8
   r9clifdyXLGe4lmV1ZonOfhGpII63mP9Nwkdzv/krVJ9YPYTELR/IAB0O
   TCvnLCt8eE8MIDUHDPN9VdDC1Dku7xUZQkPDzkGWv1aZRm9iDrnmCbWRw
   5N8MzYSq16De8rRlWsXVtVGGRniMvCnXzvu1WwVyKh1qBtg0MRR9etyZ0
   Q==;
X-CSE-ConnectionGUID: QwLqpewbRxKw4SzPxkMoxw==
X-CSE-MsgGUID: tmDgrwQUT1SXXfS74Q5fgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="63181183"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="63181183"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 12:13:59 -0700
X-CSE-ConnectionGUID: weliWc2oSCaLWztwRBeIEg==
X-CSE-MsgGUID: bRjTQAYVTpiEQpSUIRbmlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="222183335"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Mar 2026 12:13:56 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5q9R-000000009FV-2Up5;
	Thu, 26 Mar 2026 19:13:53 +0000
Date: Fri, 27 Mar 2026 03:13:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org, netdev@vger.kernel.org,
	syzbot+7b4f368d3955d2c9950e@syzkaller.appspotmail.com
Subject: Re: [PATCH 5/5] nbd: Use lock_sock_try() for TCP sendmsg() and
 shutdown().
Message-ID: <202603270301.kJulQgkT-lkp@intel.com>
References: <20260325063843.1790782-6-kuniyu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325063843.1790782-6-kuniyu@google.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <HurpAG8oY5B.A.gXhJ.GlYxpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3530
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/202603270301.kJulQgkT-lkp@intel.com
Resent-Date: Thu, 26 Mar 2026 19:30:14 +0000 (UTC)
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuniyu@google.com,m:josef@toxicpanda.com,m:axboe@kernel.dk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:horms@kernel.org,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:netdev@vger.kernel.org,m:syzbot+7b4f368d3955d2c9950e@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,bounce-nbd=lists@other.debian.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	R_SPF_NA(0.00)[no SPF record];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:dkim,intel.com:email,intel.com:mid,git-scm.com:url];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[nbd,7b4f368d3955d2c9950e];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7F3533AF38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kuniyuki,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe/for-next]
[also build test ERROR on linus/master v7.0-rc5]
[cannot apply to next-20260325]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/nbd-Remove-redundant-sock-ops-shutdown-check-in-nbd_get_socket/20260325-175457
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20260325063843.1790782-6-kuniyu%40google.com
patch subject: [PATCH 5/5] nbd: Use lock_sock_try() for TCP sendmsg() and shutdown().
config: x86_64-buildonly-randconfig-004-20260326 (https://download.01.org/0day-ci/archive/20260327/202603270301.kJulQgkT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270301.kJulQgkT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270301.kJulQgkT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: inet_shutdown_locked
   >>> referenced by nbd.c
   >>>               drivers/block/nbd.o:(nbd_mark_nsock_dead) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: tcp_sendmsg_locked
   >>> referenced by nbd.c
   >>>               drivers/block/nbd.o:(__sock_xmit) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

