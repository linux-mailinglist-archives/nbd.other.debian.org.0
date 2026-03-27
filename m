Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJiFO4dixmm+JAUAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Fri, 27 Mar 2026 11:57:11 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B575342F2F
	for <lists+nbd@lfdr.de>; Fri, 27 Mar 2026 11:57:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 66A5820657; Fri, 27 Mar 2026 10:57:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 27 10:57:11 2026
Old-Return-Path: <lkp@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	TO_TOO_MANY autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 18F0B2068C
	for <lists-other-nbd@bendel.debian.org>; Fri, 27 Mar 2026 10:41:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.499 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id IY7VSc0NBjpe for <lists-other-nbd@bendel.debian.org>;
	Fri, 27 Mar 2026 10:41:36 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .intel. - helo: .mgamail.intel. - helo-domain: .intel.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mgamail.intel.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5E90420562
	for <nbd@other.debian.org>; Fri, 27 Mar 2026 10:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774608097; x=1806144097;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jWe6OEhA34gE7fEyHsXA6R0diYZ11O4QgBijUwIUAVI=;
  b=h7tpdlnypG8nlEzenwWrfByW6AiK515+0kZGXG1hXA9Dpn0oE6XsGwuV
   9q8ZpyomS6isbcE/Hhttc88T++RDqS/yWSQ8Hj6Sn//ka/0ufDTzMu+zZ
   8YNHQW2fvpTbAxVE0H6tREwArJB7uZSrbZMeE220iBSTEHC1DiZkV21B3
   XpC7xDRgyKN+Ng0ExmpOuoHyFSsvAoabVWJedYQPRB2Sm5RwxOtpyTawH
   FSLaecmbOYjdhyt1pHH14HS2w+Q3zOx+9cDZupi/Q2FBWF47e2xnMU9e6
   7tI6hQX+ooxAZNp9hD3cgfhTyewzJ/p266qEdR2W0cf28brH6wfkyvZem
   w==;
X-CSE-ConnectionGUID: KT/UuXa5TuuAqPKsdQK2cw==
X-CSE-MsgGUID: efpgSnynR6qRRNbq5NBrlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="85986961"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="85986961"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 03:41:31 -0700
X-CSE-ConnectionGUID: 5kkWXhs2TKi8vmT27S42Lg==
X-CSE-MsgGUID: UZ64OI1qT/qx1vNhpOuskg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="225202172"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Mar 2026 03:41:25 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w64cz-00000000AAp-16RM;
	Fri, 27 Mar 2026 10:41:21 +0000
Date: Fri, 27 Mar 2026 18:40:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org, netdev@vger.kernel.org,
	syzbot+7b4f368d3955d2c9950e@syzkaller.appspotmail.com
Subject: Re: [PATCH 5/5] nbd: Use lock_sock_try() for TCP sendmsg() and
 shutdown().
Message-ID: <202603271810.hoQGfrEp-lkp@intel.com>
References: <20260325063843.1790782-6-kuniyu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325063843.1790782-6-kuniyu@google.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <tY9iobT0vKM.A.lX7L.HKmxpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3532
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/202603271810.hoQGfrEp-lkp@intel.com
Resent-Date: Fri, 27 Mar 2026 10:57:11 +0000 (UTC)
X-Spamd-Result: default: False [1.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[generic];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuniyu@google.com,m:josef@toxicpanda.com,m:axboe@kernel.dk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:oe-kbuild-all@lists.linux.dev,m:horms@kernel.org,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:netdev@vger.kernel.org,m:syzbot+7b4f368d3955d2c9950e@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,bounce-nbd=lists@other.debian.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	R_SPF_NA(0.00)[no SPF record];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,01.org:url,bendel.debian.org:helo,bendel.debian.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[nbd,7b4f368d3955d2c9950e];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B575342F2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kuniyuki,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe/for-next]
[also build test ERROR on linus/master v7.0-rc5]
[cannot apply to next-20260326]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/nbd-Remove-redundant-sock-ops-shutdown-check-in-nbd_get_socket/20260325-175457
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20260325063843.1790782-6-kuniyu%40google.com
patch subject: [PATCH 5/5] nbd: Use lock_sock_try() for TCP sendmsg() and shutdown().
config: arm64-randconfig-003-20260326 (https://download.01.org/0day-ci/archive/20260327/202603271810.hoQGfrEp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603271810.hoQGfrEp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603271810.hoQGfrEp-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/block/nbd.o: in function `nbd_mark_nsock_dead':
>> nbd.c:(.text+0x1238): undefined reference to `inet_shutdown_locked'
   aarch64-linux-ld: drivers/block/nbd.o: in function `__sock_xmit':
>> nbd.c:(.text+0x4fbc): undefined reference to `tcp_sendmsg_locked'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

